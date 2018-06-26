using System;
using System.Collections.Generic;
using System.Text;
using System.DirectoryServices;

using AutismCenterBase.Utilities;

namespace AutismCenterBase.Security
{
	public class DomainPolicy
	{
		ResultPropertyCollection _attribs;

		public DomainPolicy(DirectoryEntry domainRoot)
		{
			string[] policyAttributes = new string[] {
			"maxPwdAge", "minPwdAge", "minPwdLength", 
			"lockoutDuration", "lockOutObservationWindow", 
			"lockoutThreshold", "pwdProperties", 
			"pwdHistoryLength", "objectClass", 
			"distinguishedName"
			};

			//we take advantage of the marshaling with
			//the DirectorySearcher for Large Integer values...
			DirectorySearcher ds = new DirectorySearcher(
				domainRoot,
				"(objectClass=domainDNS)",
				policyAttributes,
				SearchScope.Base
				);

			SearchResult result = ds.FindOne();

			//do some quick validation...	   
			if (result == null)
			{
				throw new ArgumentException(
					"domainRoot is not a domainDNS object."
					);
			}

			_attribs = result.Properties;
		}

		//for some odd reason, the intervals are all stored
		//as negative numbers.  We use this to "invert" them
		private long GetAbsValue(object longInt)
		{
			return Math.Abs((long)longInt);
		}

		public string DomainDistinguishedName
		{
			get
			{
				string val = "distinguishedName";
				if (_attribs.Contains(val))
				{
					return (string)_attribs[val][0];
				}
				//default return value
				return String.Empty;
			}
		}

		public TimeSpan MaxPasswordAge
		{
			get
			{
				string val = "maxPwdAge";
				if (_attribs.Contains(val))
				{
					long ticks = GetAbsValue(
						_attribs[val][0]
						);

					if (ticks > 0)
						return TimeSpan.FromTicks(ticks);
				}

				return TimeSpan.MaxValue;
			}
		}

		public TimeSpan MinPasswordAge
		{
			get
			{
				string val = "minPwdAge";
				if (_attribs.Contains(val))
				{
					long ticks = GetAbsValue(
						_attribs[val][0]
						);

					if (ticks > 0)
						return TimeSpan.FromTicks(ticks);
				}

				return TimeSpan.MinValue;
			}
		}

		public TimeSpan LockoutDuration
		{
			get
			{
				string val = "lockoutDuration";
				if (_attribs.Contains(val))
				{
					long ticks = GetAbsValue(
						_attribs[val][0]
						);

					if (ticks > 0)
						return TimeSpan.FromTicks(ticks);
				}

				return TimeSpan.MaxValue;
			}
		}

		public TimeSpan LockoutObservationWindow
		{
			get
			{
				string val = "lockoutObservationWindow";
				if (_attribs.Contains(val))
				{
					long ticks = GetAbsValue(
						_attribs[val][0]
						);

					if (ticks > 0)
						return TimeSpan.FromTicks(ticks);
				}

				return TimeSpan.MaxValue;
			}
		}

		public int LockoutThreshold
		{
			get
			{
				string val = "lockoutThreshold";
				if (_attribs.Contains(val))
				{
					return (int)_attribs[val][0];
				}

				return 0;
			}
		}

		public int MinPasswordLength
		{
			get
			{
				string val = "minPwdLength";
				if (_attribs.Contains(val))
				{
					return (int)_attribs[val][0];
				}

				return 0;
			}
		}

		public int PasswordHistoryLength
		{
			get
			{
				string val = "pwdHistoryLength";
				if (_attribs.Contains(val))
				{
					return (int)_attribs[val][0];
				}

				return 0;
			}
		}

		public PasswordPolicy PasswordProperties
		{
			get
			{
				string val = "pwdProperties";
				//this should fail if not found
				return (PasswordPolicy)_attribs[val][0];
			}
		}
	}
}

public enum PasswordPolicy
{
	DOMAIN_PASSWORD_COMPLEX = 1,
	DOMAIN_PASSWORD_NO_ANON_CHANGE = 2,
	DOMAIN_PASSWORD_NO_CLEAR_CHANGE = 4,
	DOMAIN_LOCKOUT_ADMINS = 8,
	DOMAIN_PASSWORD_STORE_CLEARTEXT = 16,
	DOMAIN_REFUSE_PASSWORD_CHANGE = 32
}

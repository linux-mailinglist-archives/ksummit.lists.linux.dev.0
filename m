Return-Path: <ksummit+bounces-2829-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HrFCUkkg2nWhwMAu9opvQ
	(envelope-from <ksummit+bounces-2829-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 04 Feb 2026 11:49:45 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2BCE4C34
	for <lists@lfdr.de>; Wed, 04 Feb 2026 11:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E30FF3010504
	for <lists@lfdr.de>; Wed,  4 Feb 2026 10:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E36C3D34B6;
	Wed,  4 Feb 2026 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPEm3Bv0"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FFC37F11F
	for <ksummit@lists.linux.dev>; Wed,  4 Feb 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770202178; cv=none; b=e2mXKErP+5/J1njIKW2iFDmLULlK/hKcMBRF6qHABm8mf7efF/6lZEMUF6rzHqTLhNUoA5OVX2TyZyRGuGTvchV4x8idTLiuuHKqzcXhp4r3qlFqsbslnOV9tfmhB8i+IkuRh4tyd88S6fgREjlUykdfzh3v1WIfT3HKXTkWB1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770202178; c=relaxed/simple;
	bh=Z1B3mCOhCk+zgtqJ++cRSPK/7O7NKc6p5KrxaUnwkrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaiTc6hFqV6qHh5dZZqAGZGCoOWYG0MMmrWYH03/AK5lx2ok3+BcXPSshG5Vh7SU9o9cMoWm0lBIimO9/JyotAADYLV8x2MMhUS0gi+LdwG7jVBOx2gmlN/GJXSk6SuBQ4Lbx0mbtnnzdG+OkeHldgaPRZM0LbK7Qx345ps5D80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPEm3Bv0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCCBC4CEF7;
	Wed,  4 Feb 2026 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770202178;
	bh=Z1B3mCOhCk+zgtqJ++cRSPK/7O7NKc6p5KrxaUnwkrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPEm3Bv0MgZUlxbUGdU9ACcMNPuvdzkXztGCAczENzle06QrbwouuLNjBjz/GeqXB
	 dTgZr5redVbdiwUnXP6fq9YVBJYxDzO7X+VmL/Ep1HfDAxCcA0znlrsAgX1lw8nErr
	 wdGdefCggJ91b3CluZ7qhd/DfpLUpGf2xkg/eYA19ukPJfRhkQKn8G/okzgr6ci1Ty
	 OCTzSqc/p1tP8UIROBM7ulsAX4/tZrCFukJmf8n1TZU5YIL67FUVzCJjlBQYQMlW55
	 sB4zrL938krJz6ldHhqYTNp2U/caP58zG/Z/tvlhFRAqUa7wx+C4yIrAD3UO4XHrgm
	 BFFx/wCiV3b9Q==
Date: Wed, 4 Feb 2026 11:49:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Konstantin Ryabitsev <mricon@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, users@kernel.org, 
	ksummit@lists.linux.dev, "Neal H. Walfield" <neal@walfield.org>
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <2nvtfc5plg2i77hbv7jpco7q5kyym53dwume67vd3c6yvcmsyc@uaybcsxhnqjw>
References: <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
 <2026012340-wildlife-scratch-1efd@gregkh>
 <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
 <20260123-provocative-tungsten-curassow-cc2aac@lemur>
 <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
 <20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
 <x5nnix4t2w74flef4xnivzw43gx7wdk7v3cirawq52qfd6qdty@he74b5uk26zc>
 <2ef60fa3afe287cec92020b8b77a37c0b70cefaa.camel@HansenPartnership.com>
 <4ilnblmm3srkyzq7o5ehlr2gnlrrnmr67dpoqxiy5vbrrqlqd5@my3rxybcpu5t>
 <CAHk-=whoJY_pORG8M_K5kSA-x0+MwRa5wHwkHY4sbYbPFegc_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hzlynczjvehymq6d"
Content-Disposition: inline
In-Reply-To: <CAHk-=whoJY_pORG8M_K5kSA-x0+MwRa5wHwkHY4sbYbPFegc_g@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2829-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.com:url,lakedaemon.net:email]
X-Rspamd-Queue-Id: 7F2BCE4C34
X-Rspamd-Action: no action


--hzlynczjvehymq6d
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
MIME-Version: 1.0

Hello Linus,

I had valuable input for writing this mail by Neal Walfield, so the
things expressed here are a combination of our thoughts.

On Tue, Jan 27, 2026 at 01:08:12PM -0800, Linus Torvalds wrote:
> On Tue, 27 Jan 2026 at 00:39, Uwe Kleine-K=F6nig <ukleinek@kernel.org> wr=
ote:
> >
> > Thanks for the link. I was aware that Linus isn't a big fan of PGP and
> > GnuPG. Still I think that having an expiration for your PGP certificates
> > is a very sensible thing.
>
> I have never ever seen any good reason for automatic expiration, and
> it causes actual real problems because *NOBODY* ever renews those
> expiration in time and makes sure that they actually percolate out.

A good reason is that it forces the users of your certificate to
participate in the percolation of your cert. This is relevant to make
updates to the key (new or revoked UIDs and subkeys) known. For that an
expiry time of 2 years is even quite long.

> We literally had that happen just last week, and that was with a
> person that is supposed to be an *expert* in those things, and that
> uses fancy DNS key distribution etc.

Of course this all breaks if the owner of the certificate doesn't work
on extending the expiry date in time. Partly this is a tooling problem.
The tools should warn users that their certificates are going to expire.
Neal already picked up that suggestion for Sequoia:
https://gitlab.com/sequoia-pgp/sequoia-sq/-/issues/622

Also for maintaining a keyring for a group of people (e.g. kernel
developers who have write access to kernel.org archives) an extension of
an expiry date is an easy indicator for the person still being active.
So an expiry date on the PGP certificate is a good dead man's switch for
people going slowly MIA because life gets in the way. Dropping access to
the project's infrastructure for people gone missing is a good security
measure.
I intend to keep an eye on the kernel pgpkeys repo and act as a reminder
for people that already have an expiry date on their key. I already
started (even before your mail) and it seems to work, e.g.
https://lore.kernel.org/keys/aYIQdlikYqHwps3I@do-x1carbon/T/#m5285386968f9c=
4b9cbeab3ebca83e39344ff2b29
https://lore.kernel.org/keys/hn4exg4aukkf6oc4gfe3v2dx6kzz5tgg52gtdcmlfeq3yq=
dode@z5xfwu5n4osc/T/#m6733201ded6f74b4a251d02f1330d71b26fff8be

> So no. No expiration dates. They are stupid and do not work in
> practice. End of story.

This is a poor argument. Such a failure doesn't necessarily mean that
the concept of expiry dates is wrong. I think in this case it's the user
holding the tool wrong (here: failure to add a reminder and act on it)
mostly because the tool makes it harder than necessary to be held
correctly (see above). In the same way a regression in Linux between say
6.17.4 and 6.17.5 shouldn't make people stop updating to later stable
kernels. Yes, this is annoying and the responsible key owners and stable
maintainers should work hard on preventing something like that
happening. But that doesn't mean expiry dates and stable updates are
wrong.

> They are ALSO stupid because they make old signatures *look*
> untrusted. Just go and do
>
>     git log --show-signature @{15.years.ago}
>
> and look for 'expired'. It's all just sad and pointless, . What
> matters was whether that key was trusted AT THAT POINT IN TIME, not
> whether it's trusted now. But that's not how things work.

This is also a tooling problem and I agree that a signature that was
created while the key was still fresh shouldn't appear in red here.

Looking at the signature stored in commit
756f80cee766574ae282baa97fdcf9cc which was made by a key that is expired
today and verifying it by hand with GnuPG gives:

	$ gpg --verify sig input
	gpg: Signature made Wed 26 Nov 2014 05:56:50 AM CET
	gpg:                using RSA key FE3958F9067BC667
	gpg: Good signature from "Jason Cooper <jason@lakedaemon.net>" [expired]
	gpg: Note: This key has expired!
	      D783920D6D4F0C06AA4C25F3FE3958F9067BC667
	$ echo $?
	0

(If you want to reproduce:
	git cat-file commit 756f80cee766574ae282baa97fdcf9cc | sed -n '/BEGIN PGP/=
,/END PGP/ { s/^ //p }' > sig
	git cat-file commit 756f80cee766574ae282baa97fdcf9cc | sed -n '/^mergetag/=
,/Remove/ { s/^mergetag //; s/^ //; p}' > input
)

There is no coloring involved and the output looks sane. So I think it
is git that is to blame here for making the output of

	git show --show-signature 756f80cee766574ae282baa97fdcf9cc

red? I'll bring that up on the git mailing list.

> And here is why they are completely pointless: a key that is no longer
> trusted should be *REVOKED*.

Agreed. And if Jason Cooper's key material was compromised and the
certificate revoked, red in git's output would be justified.

> So when I say "revoke it", I'm talking about just letting people know
> that a key is no longer trustworthy, and then they should remove it
> from their keychain.

Here is another weakness of how GnuPG handles things. In Sequoia, import
and trusting are two separate steps whereas when using a curated keyring
(which is what you seem to do with GnuPG), importing and trusting are a
single step. This means that users have to be very careful to not
inadvertently import a certificate they don't trust. The Sequoia model
allows you to import an untrusted key and only use a broken signature as
indicator for something being wrong but without having much trust in a
good signature.

> Because once the key is no longer trustworthy, some "it will expire in
> two years" is COMPLETE AND UTTER GARBAGE.

Agreed, trust and expiry correlate only very little.

All in all I hear your opinion (and wasn't terribly surprised by it :-)
and it contains a few valid points that need to be addressed. Thanks for
your input. Still I want to gradually push for getting more people in
the kernel pgpkeyring to use an expiry date for their crypto material
for the above stated reasons.

Best regards
Uwe

--hzlynczjvehymq6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmDJD0ACgkQj4D7WH0S
/k5gqAf8DdMIJaDEBWeS1cqPJE80lX9Z39szof1nq3scpfEfTalnwVZCmrfWM5V3
dm36a7A3NfiWyFzc5cXDW5P/OJn7O6bKk2DhI3lz1WW6Yx3XaxlY7/m6Ngpjx5bD
csna86oJ06YmiQfcIZYaciQhR3/bK0hLF8/Tdv2jcXlqrH5hYXWQ/llpGSREipOR
OPo/3peAq6bmfzAhRM8qIfdPXfEO7SD+Unlm7e6kEZvMgITQ7dATGg1nLtMcETzz
SXD0xhPlQRtdnpJ+PvBLYgyIZo5s5qByY9jMwGpqJdOu1K6BqtUeXTmdn8xmTZIz
Su5hSsIcB+a2D4U1vEY97B1dSW0Xzg==
=f5xF
-----END PGP SIGNATURE-----

--hzlynczjvehymq6d--


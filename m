Return-Path: <ksummit+bounces-2840-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M2DKjG2oWm+vwQAu9opvQ
	(envelope-from <ksummit+bounces-2840-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:20:17 +0100
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C810C1B9A16
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7089B30318B5
	for <lists@lfdr.de>; Fri, 27 Feb 2026 15:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE6643D4E5;
	Fri, 27 Feb 2026 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOYoNsom"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDDF43900C
	for <ksummit@lists.linux.dev>; Fri, 27 Feb 2026 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205494; cv=none; b=nloivFKJHRpxiPpeo0+Ff2lcI2sS0J09NhgvlsfovwApUbLWgfIijEW+TvByESAGYVMfD458+dK3d6FZl39WO/XLwDl9qBTjB2hTwoa4mIi6exfNj+1U5XdxKbSbAwsORkz1KEsU7unVgEC1UTHwt99kVOIK0TQRkQvxTsnsLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205494; c=relaxed/simple;
	bh=uzFlWBg9vuwfWiK9J0+c9bFiVbZOCbqLcAIuQzL2rCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VavQ1pzomgMzg2q3oCjLd5KU6khsR+/Fv5AP9qZPCM9nsOS3xSRxJg9GRqpqiP0VvCmNcs1RPo1YFEeqYZDFVpZofRdYGxCeQ3CKgQdy9JwAnzy5N5PcCs0HylCXHLvw0VfflWTKRxdR0B4AmIn0ne9ks8EI7DOHbbM/b3cn12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tOYoNsom; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E306EC19422;
	Fri, 27 Feb 2026 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772205494;
	bh=uzFlWBg9vuwfWiK9J0+c9bFiVbZOCbqLcAIuQzL2rCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOYoNsom0ewN3/ODO6rK4UFZUiGch+n/k2pvBRJkrQ195PyrY/z8GyhDieiOMGUU7
	 3GjRk8H61fWdBL8R+EoQe20WRRvEV54fMWLAvjDWufJQ++Grcpg3es3DwpWQoHME5v
	 0yuugjWJOjDvfPo+MVgU+aoUwbHgpSab45q0tnngDPjpfQHmTYCY4SBC8JERDofy9r
	 BOS/BQAmTXH5PziEziBqGYbhrjEdEWsH+J75a5cfFuXUwWcBnYaKdWwVFYYWE462KP
	 lFrjIUzL+1nxow/IiQy1Ion8pE8sWmUX2RKW4IkjFzEWEVHdCGsaskevEYjCa0qSz/
	 ojCS6QW3/bC3A==
Date: Fri, 27 Feb 2026 15:18:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, ksummit@lists.linux.dev
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling
 update)
Message-ID: <f1366d58-c3bb-464c-8436-5770a9eb8c91@sirena.org.uk>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
 <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org>
 <20260227101631.67756268@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MCt5fF/HSip7B7N2"
Content-Disposition: inline
In-Reply-To: <20260227101631.67756268@gandalf.local.home>
X-Cookie: Only fools are quoted.
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2840-lists=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sirena.org.uk:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: C810C1B9A16
X-Rspamd-Action: no action


--MCt5fF/HSip7B7N2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2026 at 10:16:31AM -0500, Steven Rostedt wrote:

> This actually sounds like a good idea. Someone just told me that they found
> a bug in a driver and I asked them if they notified upstream about it. They
> said no, because they didn't know how.

> I just told them to randomly modify the file, do a git diff and redirect it
> into another file (making a random patch), and run get_maintainers.pl on
> it. That's a big hack and having a better interface to point others too
> would be useful.

./scripts/get_maintainer.pl --file is a bit more direct there.

--MCt5fF/HSip7B7N2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmhtbEACgkQJNaLcl1U
h9DHPQf+Pp0Z5hWHUo8K+ifWIM6n5UaIdDDRd1gZ7xsvDnHLMcxsrvWdey5NX+ES
7ar0K8rzZj/VasSB1tr0Kl/ZXUf0BK1aSOb3eJWoicSL4I3kBktQJsc+yltbpFGi
/cb909+7qYqAFDpIFNt6NtAxrADXehVoV2OKS8HJioWEtFUXcoByDZ+3ABHO+zCI
2IDL2Z1i+q5II52LkOO34lX6xy2ht/8QxeuJ36XLjvAeE3XaUJZyoJW5R8VPKvvJ
YNnKEqzNZEFeLmb2coQLZdzcfgHrPytnGzMKnHRVuzHWmDe0venK2v6gCmhSjnql
oCT2fdK+KyJ4S1ME38oi1NtfcsBMKQ==
=Kbji
-----END PGP SIGNATURE-----

--MCt5fF/HSip7B7N2--


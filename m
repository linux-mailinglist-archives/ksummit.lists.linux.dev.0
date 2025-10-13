Return-Path: <ksummit+bounces-2497-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DA53DBD3128
	for <lists@lfdr.de>; Mon, 13 Oct 2025 14:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCEFE4E1DAA
	for <lists@lfdr.de>; Mon, 13 Oct 2025 12:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD66127F166;
	Mon, 13 Oct 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7grjAxJ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC9222587
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359863; cv=none; b=mWSI27F5JeZCWfpYIsGgPnjMvPJdqPAhfZVWKszdZYKnkHk+tzDwAmFyOwD1LX8NGW7YOC0EfRzNyKC3n2JPJ/46iq+CGhIfI5lEocQ8XOivC6VxMzKein872XiWhs+V2/BAtPNrChIu0Dw50oLSviYEHrGNg7j0dR+/7+5LK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359863; c=relaxed/simple;
	bh=YaRS7yzeLyQmJ/o6WguC5hNAdZ/0JmwxQ5p3xY8u3+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEIRX4a6tmd/kbZH9zq4xGOKcvYc3UezpUUuIjk2fcdcgJcDP6s9DyXbl+8TnQ+GKkvLRzyf88URRQCy/Kqq7sthCpJJHxItKldUOgMNc66ngHNVakKxJIp4gUnPRJPqkNUE+hPPWiXCePRnHb5Pw7O46+Z2NnrS/b+Qc0FVd2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7grjAxJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB80C4CEE7;
	Mon, 13 Oct 2025 12:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760359862;
	bh=YaRS7yzeLyQmJ/o6WguC5hNAdZ/0JmwxQ5p3xY8u3+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7grjAxJnGD8yS6oEgzVhBWVyp8lGIueQUiEuuZHOI6jlpGASu2TqQyNe4cyLnNRW
	 spb/EGhcxojAoW7qPKFp81om841dqqbGyAPSeYwfYDg+udXkFerKvgECXHpkW0hbKV
	 4gu1zhTaHne5GyX0DBZZH+7n5546+B4uATc87047yAApQyjvK1Bze3ujhawDWkZscL
	 SqY+KrZ/pzGySBZd0oJgJdx0kINYK2JpWngXGJTl4SiPzk0A1J5Kil6fwgzL+O5oSZ
	 sOQxqFX8ovrIDXdLnUnM+AxyAK7J3od2oIjPhpDyjxr2YXbJV2FoBSp0zOIpLvtR1M
	 vvRRW2hIS172A==
Date: Mon, 13 Oct 2025 13:50:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <c59cc4a0-7b57-4357-94dd-7763a15bc476@sirena.org.uk>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rk0D4+xaMnDyAMWp"
Content-Disposition: inline
In-Reply-To: <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
X-Cookie: Ahead warp factor one, Mr. Sulu.


--rk0D4+xaMnDyAMWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 13, 2025 at 08:25:01AM -0400, Mathieu Desnoyers wrote:
> On 2025-10-13 07:53, James Bottomley wrote:

> > There has been a lot of discussion on the tooling list about how the
> > loss of link trailers has updated both tooling and triaging issues.
> > Konstantin has proposed a tool to get around this, but while that's in
> > development, I propose a discussion about making Link (or some
> > alternative tag) into the pointer that would work for everyone.

> AFAIU. this use of Link trailer is used as a strategy to work around
> the lack of unique identifier in patch commit messages that identifies
> multiple revisions of a patch, for tracking by patch review tooling
> and facilitate digging through patch history.

I believe a good percentage of the people actively using the links are
people looking at test results (that's me, and a bunch of others that
I've talked to).  My main usage is that I've got a failing test that
has been bisected to a commit that smells plausible enough and I want to
mail some people to tell them about the problem, I'm using the link to
grab a mailbox that I can reply to to reach a sensible set of people
with reasonable context.  In this context I don't particularly care
about the history of the patch, nor whatever review happened.  It's a
patch to email mapping.

> Based on prior email discussions I've seen, I don't think Linus is
> convinced that tagging commits with a unique identifier brings value,
> whereas people actively developing and using tools based on a
> workflow that relies on patch revision tracking see a lot of value
> in this.

TBH I'm not clear how the links/message IDs would be useful in that
context other than the history links which don't tend to get committed
since where people post them they're in the inter-version changelog
which gets dropped outside of DRM.

--rk0D4+xaMnDyAMWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjs9bIACgkQJNaLcl1U
h9AStwf/YDveaYSsGN2hg8jFs5due/sbP/9aWI265DdTltdtoBLF8mgFKp69hcXM
TNnFY31AH+xnidho5LMexZvet+qPA6HEv3KmOodGuP240jAC/iZbwPsCD61M5r7b
WdPyrAperRmYLtHXoDYJdK0DF9gsPOpaGHjZfY7vusj9DDax8mkfxIGe0MXP2cVO
oWCDxExFYr4RjA9c/RhUTagcoqUcTEM5IEu2ixpt3k7C2tJCMLEUMP8juBr7cX0r
cxMUxLMeDF9ZPOXDxaY4SIG1e8OBV8LNe/ojvVkjKLdQfDsVFINCWih/k8X/aSvo
BnrUbCl1frobFwFN3F19qilNVllsgQ==
=d1v3
-----END PGP SIGNATURE-----

--rk0D4+xaMnDyAMWp--


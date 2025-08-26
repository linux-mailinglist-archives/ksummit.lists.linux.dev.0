Return-Path: <ksummit+bounces-2226-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B5FB373CE
	for <lists@lfdr.de>; Tue, 26 Aug 2025 22:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E68F67C4596
	for <lists@lfdr.de>; Tue, 26 Aug 2025 20:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AA92C08CA;
	Tue, 26 Aug 2025 20:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+DZRx7n"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D007D28151E
	for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756240097; cv=none; b=qokmJ2wotikTUUv5vDYbRIA3LByAosyPw04ZaPjPDxfjfnjFw5NIarX6BLJaO7mC/2lX2aKaO/tgglgZUZrqSN9s3gVWz71Y7lIhTh+0Anfxi7jgmgQscFI6GN7AKlboIrNJhdpGkODMMaYkLIWfKFHwRroerPbmMuZMSaatoo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756240097; c=relaxed/simple;
	bh=GjCmdhDnmLRbnAkYKEMK99YEon6EHLCcKM1znpF621k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AaeNHQL2k4bNv9m6ZUNICDqG+fycux5pvzByqjF9fFtloDsjL7C+IrnJ9eWQP4J7lqh7jxI3Owrf3Smc1ldvcdC8kUauD05Mi+I9r9HmlEiGbMiY19+LK3nDAL6/N3IsDqqgim+MnOj+cu67LG+EVx+kPmM+PFRJg+slBT/KXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+DZRx7n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFADC4CEF1;
	Tue, 26 Aug 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756240097;
	bh=GjCmdhDnmLRbnAkYKEMK99YEon6EHLCcKM1znpF621k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E+DZRx7nd3UTcie2pYM81hFwS8SAZbr3z7G5GF5U7+f6UV4ExTIvkbtCBPmIj5fyD
	 pyCiTBeAe2LuXx9WV/06kgxeEInseRG2DGt6+19uPueuc4E+/fS06wbRs2BrFlsmow
	 meGcyn3ufwYuFYqGZuwSt6sL6LtkppTKIPliVMyLAAfZfbU+ZxDjtTJjwsHJO7R/Pb
	 WxqG6tVmguBoSrdp78r/WLgI05J+A4PpPeAZvxjb0rhCXGIbPXGHUKMr249sVXFaOX
	 +Bs7AoHV9ndE7Ef3Bg7rq3y/ihjbnp/yUpJQYEHDbmm/OxcEmgk8TpXZjFCvakQij2
	 Reci0fevdWyag==
Date: Tue, 26 Aug 2025 22:28:14 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
In-Reply-To: <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
Message-ID: <536or9s2-r219-2854-2n7s-q299s7q7noq9@xreary.bet>
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com> <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 26 Aug 2025, Linus Torvalds wrote:

> > I would like to propose a discussion on how to enforce API deprecation
> > in a way that supports efforts to reduce technical debt, without being
> > hampered by developers and maintainers who mean no harm but simply
> > don=A2t know any better.
>=20
> Here's the only thing that works: if you change the API, you have to
> fix up all existing users.
>=20
> If you are not willing to fix up all existing users, and you introduce
> a parallel API, then you are the one that maintains both the old and
> the new API forever.

I don't disagree, I just feel that it's important to note that it's pretty=
=20
much impossible to do a proper functional testing of many such=20
conversions.
Especially when drivers are involved on the consuming side. Even more so=20
if obscure ones (which is quite often the case in driver space).

But yes, if there are people who do care about such drivers, they will=20
speak up once they get hit by the breakage, so it's not a huge problem=20
either.

--=20
Jiri Kosina
SUSE Labs



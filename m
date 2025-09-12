Return-Path: <ksummit+bounces-2367-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73296B54426
	for <lists@lfdr.de>; Fri, 12 Sep 2025 09:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3050656511E
	for <lists@lfdr.de>; Fri, 12 Sep 2025 07:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539602D24AE;
	Fri, 12 Sep 2025 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g2TIHh3N"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D662D1301
	for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757663245; cv=none; b=rhScVVSCBLgwvWOPHKJBHzuYsN4PbkJH1Xs14HJQ1VQNOuIhotcJA+rv5uWYyAzOdxcDJ+h09mDzhPfeGK7mpb0s2+3i03KZE6rREkEGCTnEcJGzSlC1OEtq3HO1ZPPB3Ns7LKfWAXrmMBOUqnFRxxXSwhxQUg4dYq+/CvjzRgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757663245; c=relaxed/simple;
	bh=mifnUJ3DoQR32eXhuZsyw8T3OGoOkmPU9mSN3sDXSEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgfIDWSP7yxqieFrqhwL5dk3wcg+pnsjC6rbt8QspxQanV6LdL6T4Z6H4O59V0jsGIRLsEBygKgZDMtzit65Ze/4K+KPjjYK0YQ0NHs/ZX2UT66oAZL+GPjFB7qMhZzop8TUGjzKr2q/Iewy1K4kLbREYZua5i0B6APp0aJz+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g2TIHh3N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E0FC4CEF4;
	Fri, 12 Sep 2025 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757663245;
	bh=mifnUJ3DoQR32eXhuZsyw8T3OGoOkmPU9mSN3sDXSEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2TIHh3NHL4V5y5NgarpNJmLb5mhcHhndsMWyyKA+LD3jLIGmcak6KH2umIpbjCtV
	 Hpod/ykhQ4trkkaK01ZctMFF35Iwci67etyPTHfZTdegh1Ezu3AScHUi7p7Hyd1i0k
	 6oFWrwkYhBMr2cOAKBm6H+xZahg9Ig5SwNehRzLI=
Date: Fri, 12 Sep 2025 09:47:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Konstantin Sinyuk <sinyuk@gmail.com>, ksummit@lists.linux.dev,
	Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
Message-ID: <2025091207-blouse-scratch-dde3@gregkh>
References: <CACRpkdaKKeD3zNXM3nazfVb2m9uwfywE_rnGy3hMxwX-Aw6stQ@mail.gmail.com>
 <a74382d8-a2bf-4534-b0ee-a97d8faabf16@intel.com>
 <CAPpb9yn9akO=pBiQs0=xTcPGTY-XghK8nYcm0dAgQO1Es5udWw@mail.gmail.com>
 <CACRpkda5KwVP-J=_3goL6WAy=dR1ZQufdjT6pJyY+Fno_Hsy6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkda5KwVP-J=_3goL6WAy=dR1ZQufdjT6pJyY+Fno_Hsy6w@mail.gmail.com>

On Fri, Sep 12, 2025 at 09:22:29AM +0200, Linus Walleij wrote:
> On Thu, Sep 11, 2025 at 8:10 PM Konstantin Sinyuk <sinyuk@gmail.com> wrote:
> > On Thu, Sep 11, 2025 at 10:42:01AM +0200, Linus Walleij wrote:
> 
> > > So this gives at hand that since this is no "ordinary" memory-mapped
> > > driver, it needs its own bus and therefore intuitively its own subsystem?
> > >
> > > What about drivers/accel/ual where other accelerators live?
> > >
> > > Or if that is somehow inappropriate, just drivers/ual, don't be shy.
> >
> > Hi Linus,
> >
> > For the initial RFC, I thought to start under drivers/misc/ just as a
> > lightweight entry point to get early review. But I agree with you that
> > UALink fits more naturally as its own subsystem, similar to how CXL is
> > handled, rather than being grouped under accel. The long-term plan
> > should definitely be drivers/ual/.
> 
> If you want to "ease in" drivers the appropriate place is drivers/staging.

Not really.  Staging is for "stuff that is not cleaned up yet and we
want to do that work in-tree".  It's best for existing code bases that
have been around for a while to get dropped in there and take advantage
of people wanting to do simple "first task" type of kernel patches
(coding style cleanups, shim layer removals, spelling fixes.)

It's almost never a good idea to use staging for a new subsystem as the
work it takes to get it merged out of staging is almost always more than
it would be to just do "all of the coding style cleanups first" out of
the tree and then merge it properly.

So I do not recommend staging for anything with an "active" developer
community, as it would just slow down the acceptance of the code to the
real part of the kernel.

> But if you have a focused team and you are going to start small
> and work on this then just use drivers/accel/ual from day 1.

Totally agreed.

thanks,

greg k-h


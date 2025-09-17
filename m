Return-Path: <ksummit+bounces-2404-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A8B7D614
	for <lists@lfdr.de>; Wed, 17 Sep 2025 14:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 813783ADB67
	for <lists@lfdr.de>; Wed, 17 Sep 2025 05:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF93C13D638;
	Wed, 17 Sep 2025 05:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmkIWyzC"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E42523A
	for <ksummit@lists.linux.dev>; Wed, 17 Sep 2025 05:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758086244; cv=none; b=KU4b03u/ykzyVPJW0sgYVBxtRgo+InFVYHGFHfl+z21Oeqsmc06zLYUFylOJkSOPf16+zgwWoBgIKo++TyuXvmvuedOc3y+aTb2Qy3gkT3eLaiFM4Hs6uQEmRwlvaX43Oey/EEHYIXG/XH01blNDHzyLZ3EQnAc/4KSRNoUSZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758086244; c=relaxed/simple;
	bh=2QoKp8YXd4VOyjqFDudDVgqTFtGCtOIuXzCZdFBctLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuaceGVi5PYu9Yjcnk7W31PN0NTl2LnLUAh1yu3nN7PE6il6W8mEjKxZf9FSR9C4HzxsE18SuAsw0v6spppgOZt8KzaR02oN//0tO+12R40ZpWIwZM288H1PO5b3z+XKgtouHByGrbWB3hGxDcgtZnd3o8H6p8heYI6f4oUqu/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmkIWyzC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE61C4CEF0;
	Wed, 17 Sep 2025 05:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758086244;
	bh=2QoKp8YXd4VOyjqFDudDVgqTFtGCtOIuXzCZdFBctLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmkIWyzCw4GiDuCU+6efzpry5mX57ZRwh8SU95QW9pt/vbtaA+jKsMFoxV1D62qSW
	 8gHLDm4f+L1ivyadk5M0k73YD87DgY35/o4l/UtWdlAmWGGbyiu79HKTr9eWyRXbRO
	 8k5oFRxeHcoO+Gqzd+7wMRvyClTqWRiTh0yw8Ao+ORvdmXwPBtmvM/gyu0/58FS5Tk
	 r/4qJyUOSnxnmwoM1ADQUjFny1DjjE0ufb6jPmJqaSprKOt2eXEdtZsf//+hFpbsDL
	 Ov39ifoMEJpDDqFAQU9FxVMwAFe8kil6bWl334S3BLrIxNC+3K9kvFMKYS762P3ugl
	 sIWxbc8ZsfBPQ==
Date: Wed, 17 Sep 2025 05:17:21 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Revocable: a mechanism for preventing "classic"
 use-after-free bugs
Message-ID: <aMpEYYfMgmZ9NRRN@google.com>
References: <aMWEhqia_jpl12uI@tzungbi-laptop>
 <9q6poo2r-9589-45n8-037n-q75348021s34@xreary.bet>
 <2025091401-elm-undress-03d6@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025091401-elm-undress-03d6@gregkh>

On Sun, Sep 14, 2025 at 08:45:44AM +0200, Greg KH wrote:
> On Sun, Sep 14, 2025 at 12:19:47AM +0200, Jiri Kosina wrote:
> > On Sat, 13 Sep 2025, Tzung-Bi Shih wrote:
> > 
> > > Abstract
> > > 
> > > A "classic" Use-After-Free (UAF) can occur when resources tied to
> > > hot-pluggable devices are accessed after the device has been removed.  For
> > > example, an open file descriptor may hold references to such resources; if
> > > the device is unplugged, subsequent file operations on that descriptor can
> > > trigger an UAF.  This talk, a follow-up to a previous presentation[1],
> > > explores an approach to this challenge.
> > > 
> > > We will present "revocable"[2], a new kernel mechanism for resource
> > > management.  A revocable allows a resource provider (e.g., a device driver)
> > > to invalidate access to a resource from a consumer (e.g., a character device)
> > > when the underlying device is no longer available.  Once a resource is
> > > revoked, any further attempts to use it will fail gracefully, thus preventing
> > > the UAF.
> > > 
> > > We will discuss the design and implementation of the revocable mechanism and
> > > its application in the ChromeOS Embedded Controller drivers to fix a
> > > real-world UAF bug.  We hope to also start a discussion on how this generic
> > > mechanism could be adopted by other drivers to handle similar resource
> > > lifecycle issues.
> > > 
> > > [1] https://lpc.events/event/17/contributions/1627/
> > > [2] https://lore.kernel.org/chrome-platform/20250820081645.847919-1-tzungbi@kernel.org/T/#u
> > 
> > I will be honest and admit that I haven't looked at the linked resources 
> > yet in a big enough detail, but judging purely from the abstract above, I 
> > believe this will immediately met by "how is this different from 
> > device-managed (devm_*) resources?", so hinting about that in abstract 
> > already might be helpful.
> 
> It's quite different, devm_ can be built on top of it, like it was done
> for the rust implementation for devm_*, so yes, it would be good to say
> something about that.

Thank you both for the feedback, that's a very good point.

Here is the revised (in the second paragraph) abstract:

A "classic" Use-After-Free (UAF) can occur when resources tied to
hot-pluggable devices are accessed after the device has been removed.  For
example, an open file descriptor may hold references to such resources; if
the device is unplugged, subsequent file operations on that descriptor can
trigger an UAF.  This talk, a follow-up to a previous presentation[1],
explores an approach to this challenge.

We will present "revocable"[2], a new kernel mechanism for resource
management.  While the existing devres framework manages resource lifetime
and cleanup, revocable addresses the distinct problem of access invalidation.
A revocable allows a resource provider (e.g., a device driver) to invalidate
access to a resource from a consumer (e.g., a character device) when the
underlying device is no longer available.  Once a resource is revoked, any
further attempts to use it will fail gracefully, thus preventing the UAF.

We will discuss the design and implementation of the revocable mechanism and
its application in the ChromeOS Embedded Controller drivers to fix a
real-world UAF bug.  We hope to also start a discussion on how this generic
mechanism could be adopted by other drivers to handle similar resource
lifecycle issues.


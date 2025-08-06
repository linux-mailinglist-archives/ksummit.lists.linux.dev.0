Return-Path: <ksummit+bounces-2092-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D26C7B1C1CB
	for <lists@lfdr.de>; Wed,  6 Aug 2025 10:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71F7A186606
	for <lists@lfdr.de>; Wed,  6 Aug 2025 08:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16AE21D3EC;
	Wed,  6 Aug 2025 08:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O2Di3VRW"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545FD219A71
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754467480; cv=none; b=OVCwCRd1wRuMcIccFN5zWPw24QVr+lsBi58msfuYp1fTifNh6u1m/AM2KiEgU0VYycbohMQY1bOnyPUR9X/E3C14qcT8r6E/QNDpZO1V7U+aShaCGbvsl0wbmNio+MRyUPD/x4LWsdUCNI/5I+O8u1qabtZD1Lqm3yWSn1CAawA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754467480; c=relaxed/simple;
	bh=8rVpfaiseEnwodk3bw/JtWFIBafUgmXwpNei8S8DMhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvC5y0K/Qr+YmlKWZVfMeIJ4tcV6WBicvuUEf4QqoWcFLVLqKd6OZsFRCVgmYqWiw4dH1Pao3avwu7aka38UPHgz7rYlA6vJ5aBesBY90f+ZzfACiPvsSMkHMny5cu8DpTdx+37/gtLsoo/qkDp2DqlLty3VGRTxu5mW5xc2qlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O2Di3VRW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D2BC4CEE7;
	Wed,  6 Aug 2025 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754467479;
	bh=8rVpfaiseEnwodk3bw/JtWFIBafUgmXwpNei8S8DMhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2Di3VRWfkUzyB3dYPAGp3mKy163pFXJb8VbbgZD1Uqa2x0rApBKNsLoBaas4zQH0
	 J2KkMKysE74cRzOqDiVMmdkqRtM8eNxBWT/y2IpXR5AwyVhC1RZjeurlJppRmhs4d6
	 O+wXRTNdR4uHxc5pOgXMdDL5W/qcmDYoov9kunaY=
Date: Wed, 6 Aug 2025 09:04:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <2025080602-caution-uniformed-f5fa@gregkh>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>
 <aJI-wBgmE8LoTyyZ@lappy>
 <cd9ecc4e0913ff9e012cf3c1f07c5920742eac24.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd9ecc4e0913ff9e012cf3c1f07c5920742eac24.camel@HansenPartnership.com>

On Tue, Aug 05, 2025 at 01:33:39PM -0400, James Bottomley wrote:
> On Tue, 2025-08-05 at 13:26 -0400, Sasha Levin wrote:
> > On Tue, Aug 05, 2025 at 12:49:02PM -0400, James Bottomley wrote:
> [...]
> > > Actually, if stable emails just had a header tag, it would be easy
> > > for procmail to sort them out ... which is what I've been asking
> > > for for years.  X-Stable-Base: and X-Stable: seem to be reasonably
> > > common and catch most of it, but codifying the use in the kernel
> > > documentation and using them consistently would really help.
> > 
> > Do we have any stable-related mails that don't have an X-Stable:
> > header?
> 
> It seems to be mostly working for now, but what I often find is the
> header changes on a whim and the filter stops working.

When has it changed?  If it does, always let us know as odds are it is
not intentional.

> And, since nothing is written down, we all have to guess again what it
> means.  If you're confident this one's not going to change, why not
> document it and commit to using it in the stable process docs?

Sure, I can do that.

But also, if these emails really aren't needed/wanted, we can easily
just not send them out.  I have done so since the start of the stable
kernel process, just over 20 years ago, as I thought they were
informative.  But if not, and people are just treating them as spam to
file away, I can gladly ONLY email them to the stable-commits mailing
list so that lore can properly archive them.

thanks,

greg k-h


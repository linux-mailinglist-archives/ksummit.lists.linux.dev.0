Return-Path: <ksummit+bounces-2052-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 864C6B1B97B
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5232218A5D0E
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224E02222D2;
	Tue,  5 Aug 2025 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iSlWfh1i"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC64A55
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754415286; cv=none; b=A7NNh5rykoMaC7Bh7xGIKFonNI/dv+jA82/whGOy5izgGyRpTfK6IKbEJfIqI6iMwUl1pdd85V5hqS/pzbTDen8wwy2r7hpo7pzM5pu2NrZZBFdTQyCaV9/G7S2Hi6iw2KCSLuDk2/hVx8HgfOWhS9wGHGtyFff6tY0BnDGlcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754415286; c=relaxed/simple;
	bh=ncHh7cfxHsEzkvOGrDT2+rAf/vqKqFdbAfptLJJpuSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCj+wWRaCnMbW3w2hMG9YLC98+jvgMbUoF6Z1U72SfNZUY9PmZaaMMQSkSmJm+xkQOs+yp7EBbn4za6GUL/rANqP3kqwZYMf94YH5INmHKYL05GQ+HYSObCLVB5v3LhB2vzUcrv5wlkxiSISY3M9wlKbauIdXTyGGNsvJT7oFio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iSlWfh1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAC1C4CEF8;
	Tue,  5 Aug 2025 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754415286;
	bh=ncHh7cfxHsEzkvOGrDT2+rAf/vqKqFdbAfptLJJpuSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSlWfh1i/9nHI7mu4d0nwEAMWO1UJNXlPUgeDpjBDsVIMq+ssQ7OobxWI4Oln+8D9
	 J9xBZtLyJX62ibPEXBN3XiA2xLDEb/bGRwTZleWPfKlVK7lQWg9VWVfo5/oe3P1bLo
	 WuqY8RgfmXF9GFvmXl8sKXF7l//ezZswnqxo9fiE=
Date: Tue, 5 Aug 2025 18:34:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <2025080515-grandpa-prankster-ee83@gregkh>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>

On Tue, Aug 05, 2025 at 12:49:02PM -0400, James Bottomley wrote:
> On Tue, 2025-08-05 at 17:38 +0200, Jiri Kosina wrote:
> > This proposal is coming as a followup to the brief IRC discussion
> > that happened a few months back.
> > 
> > The amount of e-mails that are coming (with maintainers directly
> > CCed) as a result of patches being merged to -stable is so
> > overwhelming that I am not sure that people are making any productive
> > use of it whatsoever.
> > 
> > I am personally pretty much ignoring most of it, as (a) I wouldn't
> > have time to do anything else otherwise (b) I don't have a sufficient
> > motivation / time to invest effort into stable in the fist place.
> > 
> > I feel it'd be beneficial to discuss this, and (depending on the
> > outcome)perhaps make it opt-in (or opt-out) at least, with
> > people/subsystems  having means how to be excluded from all that ...
> > ?
> 
> Actually, if stable emails just had a header tag, it would be easy for
> procmail to sort them out ... which is what I've been asking for for
> years.  X-Stable-Base: and X-Stable: seem to be reasonably common and
> catch most of it, but codifying the use in the kernel documentation and
> using them consistently would really help.

These "a patch has been added to the stable queue" has had the following
X- tags on them since August 2023:

	X-stable: commit
	X-Patchwork-Hint: ignore

and I'm sure I only added that because you, or someone else, asked :)

You can also filter on stable-commits@vger.kernel.org, which is what I
do locally.

So filter away!

thanks,

greg k-h


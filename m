Return-Path: <ksummit+bounces-1247-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B2907425
	for <lists@lfdr.de>; Thu, 13 Jun 2024 15:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 266051C22DD0
	for <lists@lfdr.de>; Thu, 13 Jun 2024 13:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC87C8C7;
	Thu, 13 Jun 2024 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D8iUmQu4"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B77A20E3
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286348; cv=none; b=DunyB8HwrILRGjXwLZ8Tw0NhjYAtSd+8G7ke1VfM4PlyTuEQ0NxrJe4wpu8EswqAqpBTkf2TsxRLOfk/+v+gUjo7fJ0QqTyZjL6oh39MF40Pq9R/M1WcAzecsR+UM0kXvx4Jcnpzhc5QAyfiBZYztELLf0//Ah6h20fa7PXPSEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286348; c=relaxed/simple;
	bh=B+ceXy9WlXEliVHsBLlr5nAm8Mvy903JjCwSdpG8LH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lt9So/oWJbjTnMYejMA57QxVjBrdJ4/pNLXmHjOhoDq2zJZn25kTDPRR+VqoqNtSrIkTXBywVZW6ML8JWtIvDMuH7WFVBGksyyItIg/Q/X0AJKM0aesTDMqoam6b3NYMINOQ1bO+kWvkTsSoI1pWZb7dE1SBqpnsHtsZDm4qwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D8iUmQu4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5915C2BBFC;
	Thu, 13 Jun 2024 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718286348;
	bh=B+ceXy9WlXEliVHsBLlr5nAm8Mvy903JjCwSdpG8LH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8iUmQu4xQV5faBwE7AQho1DLAeRQupBDqOY8wqqys1lDma+rxIcGJo289DIQCAq4
	 0XI2WFbP1OfLdxLIko2pXlu+hQCms/oGTOghHU4rVTxLmSqUEWFPXUVx3Df88nxez1
	 24Qs72joFM4x0s0eOSShOwHTJnSeKBwYpEt7hKUk=
Date: Thu, 13 Jun 2024 15:45:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <2024061327-browse-sterling-9bf6@gregkh>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>

On Thu, Jun 13, 2024 at 07:58:58AM -0400, James Bottomley wrote:
> On Thu, 2024-06-13 at 10:42 +0200, Thorsten Leemhuis wrote:
> > The scenario shown at the start of the thread illustrates a problem I
> > see frequently: commits with a Fixes: tag end up in new to stable
> > series releases just days after being mainlined and cause regressions
> > -- just like they do in mainline, which just was not known yet at the
> > time of backporting. This happens extremely often right after merge
> > windows when huge piles of changes are backported to the stable trees
> > each cycle shortly after -rc1 is out (which even some kernel
> > developers apparently are somewhat afraid to test from what I've
> > seen).
> 
> I haven't really observed this for curated fixes.  For most subsystems,
> patches with Fixes tags that are cc'd to stable tend to go steadily
> outside the merge window.  Obviously a few arrive within it, but
> usually at roughly the rate they arrive outside it.
> 
> What I observe in the merge window is huge piles of patches go into
> stable *without* a cc:stable tag from the autosel machinery (and quite
> a few even without fixes: tags).

The merge window has a huge number of patches sent to Linus _with_ a
Fixes: tag, or a cc: stable tag.  It's our busiest time of the cycle by
far.  But overall, it's still a smaller % of the patches that end up in
the tree overall, so it looks big to us and everyone else, but it's
really not.  The % going in during the end -rc cycles is still higher,
as it rightfully should.

Only patches I see in our trees that do not come from autosel without
fixes: tags should have a stable-dep-of: tag, OR it is because someone
has sent it to us for explicit inclusion.  If you see stuff that does
not meet that criteria, please let us know.

thanks,

greg k-h


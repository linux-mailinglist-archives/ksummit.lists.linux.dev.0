Return-Path: <ksummit+bounces-73-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3851136819B
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 7E4AE3E553F
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0852FA1;
	Thu, 22 Apr 2021 13:41:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8D2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:41:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4F3D61426;
	Thu, 22 Apr 2021 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619098873;
	bh=AV8XfeFatitbRPA8kk3azKWG1/TBbVLMw1uLCCPHI6M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M2eWp66UXMHM28sdJ0lzXwVK/nlfQITSiMjtVJXI9nmuxsDMa5LRQxFqnI/+WLsIM
	 WJAkZRMAEyVV1ibOsysgYEMPZaELxN4fgulLJX14EkVnlajc4zUmH1D5/A5uU+mYAZ
	 MpjFIQeR4j5d++Spv+t0yHsuVq+asMANXDK+RREWVszuY0+6k2zp4zkKl4r7G1HGcg
	 cmn8kcNYHxhc20y/IFeyebq7YtkEptY+wfK97qEQDtWL3iR91Ar8+qA3B0snAfzw+J
	 RvIa9tvs+G02Fl9LieYkor5b5q+t5XeSVQnKFEYfGEB/u4yPJWVefO8QmEY6gt+Bin
	 O+sA1dg3DC85g==
Date: Thu, 22 Apr 2021 15:41:06 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Dan Carpenter
 <dan.carpenter@oracle.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422154106.5dd10395@coco.lan>
In-Reply-To: <YIFpJ55cCPxd/las@linux.ibm.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210421194702.GH1981@kadam>
	<20210422113404.09f35a85@coco.lan>
	<68c628ed354ea1ddea81878f0d713d2ce6426126.camel@sipsolutions.net>
	<20210422125233.4eed09be@coco.lan>
	<YIFpJ55cCPxd/las@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 22 Apr 2021 15:16:39 +0300
Mike Rapoport <rppt@linux.ibm.com> escreveu:

> On Thu, Apr 22, 2021 at 12:52:33PM +0200, Mauro Carvalho Chehab wrote:
> > Em Thu, 22 Apr 2021 11:59:38 +0200
> > Johannes Berg <johannes@sipsolutions.net> escreveu:
> >   
> > > On Thu, 2021-04-22 at 11:34 +0200, Mauro Carvalho Chehab wrote:  
> > > > 
> > > > Here, I use "wdiff" in order to deal with renames. It has a somewhat
> > > > funny dialect, but it helps a lot reviewing renaming patches.    
> > > 
> > > This also helps for casual "git show" etc.:
> > > 
> > > [core]
> > > 	pager = /usr/share/git-core/contrib/diff-highlight | less -RFX
> > > 
> > > (path may vary, of course)  
> > 
> > Nice!
> > 
> > Yet, at least on Fedora 33, I had to add a small perl script for it to
> > work (modified from https://github.com/git/git/blob/master/contrib/diff-highlight/diff-highlight.perl),
> > as git-core-doc-2.28.0-1.fc33.noarch only contains DiffHighlight.pm.  
> 
> With git 2.29 it works fine on my F33.

Didn't test 2.29. I had to downgrade yesterday from 2.30, due to this
issue:

	https://bugzilla.redhat.com/show_bug.cgi?id=1952030


Thanks,
Mauro


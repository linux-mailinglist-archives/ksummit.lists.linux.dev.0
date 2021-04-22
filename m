Return-Path: <ksummit+bounces-52-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81223367F10
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A8A2D1C436F
	for <lists@lfdr.de>; Thu, 22 Apr 2021 10:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6EB2FA1;
	Thu, 22 Apr 2021 10:52:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137AF2F81
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 10:52:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47269611CD;
	Thu, 22 Apr 2021 10:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619088758;
	bh=IVKbUhFUDYmbnA0/jhFIZJUnQZpWK3JBpS/Z7mvOg90=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rNny3hPOxdyWjqd2XiMM9IJWsb12T2xDR0QKmoP7qhEiTkvqDVaMU1JKp44y8Z4a5
	 wWHSXwGyfmKsxgN3YeLSVG3+6Qsj6GaeDdbQJsEO+lBNFsnv4/xz/BvSMF+/7CuopV
	 f2OA8XrXawi4hj8yKmCw0xl/WxXJkRJTOoqG6I5Mkqg93lz3wOoeQa1Oztg40+i/w0
	 OsCRhssPJvTc2bTpZi2gwpny8Fdicbsfl93d+8iMcYMV4vrUirxYxilcYqNu8w9UyI
	 Y0gDRDghPWrwOKSl4ypvIhFl9onNCNFBOqtcpdNZaqnYxu2MshLFppjgUq/Oibh8jU
	 W0cd6gh2Kz2eg==
Date: Thu, 22 Apr 2021 12:52:33 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Dan Carpenter  <dan.carpenter@oracle.com>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422125233.4eed09be@coco.lan>
In-Reply-To: <68c628ed354ea1ddea81878f0d713d2ce6426126.camel@sipsolutions.net>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210421194702.GH1981@kadam>
	<20210422113404.09f35a85@coco.lan>
	<68c628ed354ea1ddea81878f0d713d2ce6426126.camel@sipsolutions.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 22 Apr 2021 11:59:38 +0200
Johannes Berg <johannes@sipsolutions.net> escreveu:

> On Thu, 2021-04-22 at 11:34 +0200, Mauro Carvalho Chehab wrote:
> > 
> > Here, I use "wdiff" in order to deal with renames. It has a somewhat
> > funny dialect, but it helps a lot reviewing renaming patches.  
> 
> This also helps for casual "git show" etc.:
> 
> [core]
> 	pager = /usr/share/git-core/contrib/diff-highlight | less -RFX
> 
> (path may vary, of course)

Nice!

Yet, at least on Fedora 33, I had to add a small perl script for it to
work (modified from https://github.com/git/git/blob/master/contrib/diff-highlight/diff-highlight.perl),
as git-core-doc-2.28.0-1.fc33.noarch only contains DiffHighlight.pm.

Thanks,
Mauro

#!/usr/bin/perl
BEGIN {push @INC, '/usr/share/doc/git/contrib/diff-highlight/'}
use DiffHighlight;

# Some scripts may not realize that SIGPIPE is being ignored when launching the
# pager--for instance scripts written in Python.
$SIG{PIPE} = 'DEFAULT';

DiffHighlight::highlight_stdin();
exit 0;


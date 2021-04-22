Return-Path: <ksummit+bounces-31-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC3F367988
	for <lists@lfdr.de>; Thu, 22 Apr 2021 07:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 267E91C2CA8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 05:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352E32FA3;
	Thu, 22 Apr 2021 05:52:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C72F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 05:52:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B29B861425;
	Thu, 22 Apr 2021 05:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619070772;
	bh=ppguqPbfcxvbb2ZosdqesSeExTB3hunq3TaB8ITgS1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9PGJbL3iQ5O+fcHd7joLgdZFSIErSIEct6OMEH1F8XTVLow5DxF7DQ0kEeE0SBLA
	 QUNvAk/K4c8OTdvuZnXEiEuGSwGIbriQWMRDMkiqJegliTXNGeXeWNoaf0S3eAfL5b
	 JX7vn5wYcI57Ub1+HmlaYTBd/xFKfoZJ0CZ0k2Z0W4eG3gCaIGxHD1k5HWykUURjcp
	 /bV2alyJbroiLMp/EKWRBxCSw1XepFApY2+N8Wy2yzzOx2gIme1BIVEkYtUCu7QKdg
	 LSdV/4/yCzXmQ09SG9+mc+BzMQAlS15456+T+Q5j5iHL5ZVb0bqBkIgFkPlsmUjxm9
	 CrKuuuv4j3eLw==
Date: Thu, 22 Apr 2021 08:52:48 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIEPMMH6dOmMrYqU@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <YIEB/Azk3cGD8osf@zeniv-ca.linux.org.uk>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIEB/Azk3cGD8osf@zeniv-ca.linux.org.uk>

On Thu, Apr 22, 2021 at 04:56:28AM +0000, Al Viro wrote:
> On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:
> > On Wed, Apr 21, 2021 at 11:35:36AM -0700, James Bottomley wrote:
> > > I've long been on record as not really being a fan of trivial patches
> > > because they can cause merge issues with current patches and introduce
> > > bugs, particularly in older drivers, that don't get detected for a long
> > > while.  However, the recent events with the University of Minnesota:
> > > 
> > > https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> > > 
> > > Have elevated the risk factor around trivial patches claiming to fix
> > > bugs to the point where it looks like there's no such thing as a truly
> > > trivial patch and they all need reviewing.
> > 
> > While we are talking about policies, I would like to raise another bad
> > practice that is done by even seasoned developers - sending patches with
> > carefully crafted and filtered TO and CC.
> > 
> > This practice causes to get out of context patches without ability to
> > see whole picture and the worse part that it divides feedback to
> > "islands" without ability to agree or disagree with the feedback.
> 
> Suppose you have a 60-patch series, with 56 in fs/*.c (and related headers
> in include/linux) and 4 - in arch/*/include/asm/*; should e.g. MIPS folks
> get spammed with the entire thing, just because one patch consolidates
> some ifdefs?

Yes, I still would like to see whole series, because such patch bombs
are not supposed to be too often and if they are, it can hint that the
changed area needs some restructure/changes/e.t.c to make submission
easier.

Thanks


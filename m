Return-Path: <ksummit+bounces-29-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F04B367903
	for <lists@lfdr.de>; Thu, 22 Apr 2021 06:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 7A62D3E2AA5
	for <lists@lfdr.de>; Thu, 22 Apr 2021 04:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DEB2FA2;
	Thu, 22 Apr 2021 04:56:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF582F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 04:56:31 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lZRO8-007Dkk-SM; Thu, 22 Apr 2021 04:56:28 +0000
Date: Thu, 22 Apr 2021 04:56:28 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Leon Romanovsky <leon@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIEB/Azk3cGD8osf@zeniv-ca.linux.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YID5xhy2vv45fnOv@unreal>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:
> On Wed, Apr 21, 2021 at 11:35:36AM -0700, James Bottomley wrote:
> > I've long been on record as not really being a fan of trivial patches
> > because they can cause merge issues with current patches and introduce
> > bugs, particularly in older drivers, that don't get detected for a long
> > while.  However, the recent events with the University of Minnesota:
> > 
> > https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> > 
> > Have elevated the risk factor around trivial patches claiming to fix
> > bugs to the point where it looks like there's no such thing as a truly
> > trivial patch and they all need reviewing.
> 
> While we are talking about policies, I would like to raise another bad
> practice that is done by even seasoned developers - sending patches with
> carefully crafted and filtered TO and CC.
> 
> This practice causes to get out of context patches without ability to
> see whole picture and the worse part that it divides feedback to
> "islands" without ability to agree or disagree with the feedback.

Suppose you have a 60-patch series, with 56 in fs/*.c (and related headers
in include/linux) and 4 - in arch/*/include/asm/*; should e.g. MIPS folks
get spammed with the entire thing, just because one patch consolidates
some ifdefs?


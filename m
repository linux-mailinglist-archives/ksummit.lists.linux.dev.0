Return-Path: <ksummit+bounces-7-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8AB36732C
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0E1123E15CD
	for <lists@lfdr.de>; Wed, 21 Apr 2021 19:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED2B2FA0;
	Wed, 21 Apr 2021 19:06:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2B62F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 19:06:25 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lZIB6-00777o-In; Wed, 21 Apr 2021 19:06:24 +0000
Date: Wed, 21 Apr 2021 19:06:24 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIB3sFBx1KC1nNRX@zeniv-ca.linux.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Apr 21, 2021 at 11:35:36AM -0700, James Bottomley wrote:
> I've long been on record as not really being a fan of trivial patches
> because they can cause merge issues with current patches and introduce
> bugs, particularly in older drivers, that don't get detected for a long
> while.  However, the recent events with the University of Minnesota:
> 
> https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> 
> Have elevated the risk factor around trivial patches claiming to fix
> bugs to the point where it looks like there's no such thing as a truly
> trivial patch and they all need reviewing.
> 
> Our policy in SCSI for a long time has been no trivial patches accepted
> to maintained drivers, and I think that would be a good start if
> adopted kernel wide,

Er...  I'm not sure I understand you correctly; suppose maintainer of a driver
gets what pretends to be an obvious fix, complete with analysis, verifies that
the bug is real and the fix is correct.  What should that maintainer do under
your policy?


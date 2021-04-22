Return-Path: <ksummit+bounces-97-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3152036837E
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 9A7581C56C5
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298752FA0;
	Thu, 22 Apr 2021 15:36:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E82170
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:35:57 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94)
	(envelope-from <johannes@sipsolutions.net>)
	id 1lZbMt-00FEq4-9Y; Thu, 22 Apr 2021 17:35:51 +0200
Message-ID: <ad19bcd97f8f15294559a12392e6aa8521019788.camel@sipsolutions.net>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: Johannes Berg <johannes@sipsolutions.net>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: ksummit@lists.linux.dev
Date: Thu, 22 Apr 2021 17:35:50 +0200
In-Reply-To: <99289ff4cf7b1e59f82c330728c80dc7e63319a7.camel@HansenPartnership.com>
References: 
	<afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	 <20210422123559.1dc647fb@coco.lan> <yq1o8e6shil.fsf@ca-mkp.ca.oracle.com>
	 <99289ff4cf7b1e59f82c330728c80dc7e63319a7.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Thu, 2021-04-22 at 08:28 -0700, James Bottomley wrote:
> On Thu, 2021-04-22 at 08:32 -0400, Martin K. Petersen wrote:
> > Another metric that may be worth capturing is how many Fixes: tags
> > refer to patches authored by this submitter.
> 
> Or perhaps invert it: no bug fix without a Fixes: tag.

We do this internally on our driver (it also helps see if release
branches need a certain fix or not), but even then you sometimes just
have to give up and say "unknown". Which is still useful to an extent as
long as the developer did the work and didn't just blindly say
"unknown", though the maintainer(s) usually will see and challenge that.

johannes



Return-Path: <ksummit+bounces-50-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435DD367E64
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 65E681C418D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 10:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92272FA1;
	Thu, 22 Apr 2021 10:15:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E2571
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 10:15:18 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94)
	(envelope-from <johannes@sipsolutions.net>)
	id 1lZW7Y-00F86l-48; Thu, 22 Apr 2021 11:59:40 +0200
Message-ID: <68c628ed354ea1ddea81878f0d713d2ce6426126.camel@sipsolutions.net>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: Johannes Berg <johannes@sipsolutions.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Carpenter
	 <dan.carpenter@oracle.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, 
	ksummit@lists.linux.dev
Date: Thu, 22 Apr 2021 11:59:38 +0200
In-Reply-To: <20210422113404.09f35a85@coco.lan>
References: 
	<afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	 <20210421194702.GH1981@kadam> <20210422113404.09f35a85@coco.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Thu, 2021-04-22 at 11:34 +0200, Mauro Carvalho Chehab wrote:
> 
> Here, I use "wdiff" in order to deal with renames. It has a somewhat
> funny dialect, but it helps a lot reviewing renaming patches.

This also helps for casual "git show" etc.:

[core]
	pager = /usr/share/git-core/contrib/diff-highlight | less -RFX

(path may vary, of course)

johannes



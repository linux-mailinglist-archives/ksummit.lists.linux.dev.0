Return-Path: <ksummit+bounces-102-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65295368430
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 6F7451C6068
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3252FA0;
	Thu, 22 Apr 2021 15:48:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAEC70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 68D501280151;
	Thu, 22 Apr 2021 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619106502;
	bh=ctJKBXms9d13cwWXNfXMtDlcU8XOFUPFAEd1cFoSaMc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=xyePf1oEzx3I284fZRruObGjj1+gPAC7RI9IUVRMCsHzZjNGOLc6suVSvxitiJwL/
	 6ucrgzzM54GHseeBor2j3YcP9RGE9QbiCHo+3/foJE8y1z2kwYZNvI0WvBtqCEOFdu
	 54k60RyFypnbE2l66C+oW6YpfhIbsthCfU6LO3wA=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUkHawc5iVZz; Thu, 22 Apr 2021 08:48:22 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 1C459128014E;
	Thu, 22 Apr 2021 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619106502;
	bh=ctJKBXms9d13cwWXNfXMtDlcU8XOFUPFAEd1cFoSaMc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=xyePf1oEzx3I284fZRruObGjj1+gPAC7RI9IUVRMCsHzZjNGOLc6suVSvxitiJwL/
	 6ucrgzzM54GHseeBor2j3YcP9RGE9QbiCHo+3/foJE8y1z2kwYZNvI0WvBtqCEOFdu
	 54k60RyFypnbE2l66C+oW6YpfhIbsthCfU6LO3wA=
Message-ID: <dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>
Cc: ksummit@lists.linux.dev
Date: Thu, 22 Apr 2021 08:48:21 -0700
In-Reply-To: <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
References: 
	<afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	 <20210422123559.1dc647fb@coco.lan>
	 <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
	 <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-22 at 08:42 -0700, James Bottomley wrote:
[...]
>    2. Improving the requirement for bug fixes and large series, like
> cover letters to everyone, adding fixes: tag and clear explanation.

Just on this one, can we get the mailing list to help now we're moving
to a new infrastructure?  I was already thinking of asking if it could
reject email with html parts rather than simply losing it, but perhaps
it could reject threaded submissions where the cover letter isn't
correctly cc'd?  I know that's a big ask because there has to be an
easy way to recognize them (heuristics on the PATCH tag?) and a way to
recognize missing cc's (perhaps simply that someone cc'd on the
threaded [PATCH x/y] reply isn't cc'd on [PATCH 0/y]?)

James




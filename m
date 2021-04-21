Return-Path: <ksummit+bounces-9-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A0367342
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 505753E183D
	for <lists@lfdr.de>; Wed, 21 Apr 2021 19:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFA12FA0;
	Wed, 21 Apr 2021 19:14:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B052F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 19:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 53DC6128014C
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 12:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619032470;
	bh=wdVrzSjTf9KJOd+GHHdcZb7lKEEl45895MFlxtf4GqY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=o6bAvyBQvT5Dlk8bAmEL29JwqGKheVPFjXJaodHAwNvL8oU9GwpDSdGalACw70d8A
	 OmpZGdFuGh2FU0pkicrzROgEB1xjOOqrTfMujXOGpur/nv9bA0zPGd+ihgqZp5P2+f
	 V4z58r3iGPsoi+U0HNk4mSpq3tjSd3EZQZvoxyCk=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VcBRAFkAZh_f for <ksummit@lists.linux.dev>;
	Wed, 21 Apr 2021 12:14:30 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 2354C1280151
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 12:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619032470;
	bh=wdVrzSjTf9KJOd+GHHdcZb7lKEEl45895MFlxtf4GqY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=o6bAvyBQvT5Dlk8bAmEL29JwqGKheVPFjXJaodHAwNvL8oU9GwpDSdGalACw70d8A
	 OmpZGdFuGh2FU0pkicrzROgEB1xjOOqrTfMujXOGpur/nv9bA0zPGd+ihgqZp5P2+f
	 V4z58r3iGPsoi+U0HNk4mSpq3tjSd3EZQZvoxyCk=
Message-ID: <868f996b6dd20226c35e200a4b9611f2b6e8b559.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: ksummit@lists.linux.dev
Date: Wed, 21 Apr 2021 12:14:29 -0700
In-Reply-To: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
References: 
	<afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-04-21 at 11:35 -0700, James Bottomley wrote:
> I've long been on record as not really being a fan of trivial patches
> because they can cause merge issues with current patches and
> introduce bugs, particularly in older drivers, that don't get
> detected for a long while.  However, the recent events with the
> University of Minnesota:
> 
> https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> 
> Have elevated the risk factor around trivial patches claiming to fix
> bugs to the point where it looks like there's no such thing as a
> truly trivial patch and they all need reviewing.
> 
> Our policy in SCSI for a long time has been no trivial patches
> accepted to maintained drivers,

Sorry, Viro caught this: that should be "no trivial patches accepted to
*un*maintained driver ..."

James


>  and I think that would be a good start if
> adopted kernel wide, but I think the next policy should be no trivial
> bug fix without a pointer to the actual bug report or report from a
> trusted static checker.  This would likely mean we have to create a
> list of trusted static checkers ... obviously 0day and coverity but
> what else?
> 
> James
> 
> 
> 




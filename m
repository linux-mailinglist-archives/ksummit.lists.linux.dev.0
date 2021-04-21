Return-Path: <ksummit+bounces-17-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF6A36742D
	for <lists@lfdr.de>; Wed, 21 Apr 2021 22:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id B0BAE3E21B5
	for <lists@lfdr.de>; Wed, 21 Apr 2021 20:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6D62FA0;
	Wed, 21 Apr 2021 20:28:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0832F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 20:28:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7E1F2B21F;
	Wed, 21 Apr 2021 20:28:53 +0000 (UTC)
Date: Wed, 21 Apr 2021 22:28:53 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <nycvar.YFH.7.76.2104212125330.18270@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2104212226420.18270@cbobk.fhfr.pm>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <nycvar.YFH.7.76.2104212125330.18270@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Apr 2021, Jiri Kosina wrote:

> I am all for discussing policy of trivial patches (*), but just to make it 
> clear -- I don't think that's really directly related to the University of 
> Minnesota issue.

(*) saying that as a de-facto maintainer of trivial.git, although that 
    tree has been severely neglected over the past years. Also, as far as 
    I can say, none of the umn.edu patches went in through the trivial 
    tree

Thanks,

-- 
Jiri Kosina
Director, SUSE Labs Core


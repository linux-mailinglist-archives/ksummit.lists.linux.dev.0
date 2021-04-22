Return-Path: <ksummit+bounces-92-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A21C36834D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 468E41C44C5
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EDE2FA0;
	Thu, 22 Apr 2021 15:28:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07C770
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 19BB71280A3B;
	Thu, 22 Apr 2021 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619105283;
	bh=QhpPv/fAlstpyAkmQA60jG7XbOcwhVdRULreTcZMzPM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=m+A2bSWIlm1XYnLLWnBh10yA3B5upqn75/fdtM4tmeguEQ7EzGt0GnjWVUt4uj0H8
	 GJKwLcjKL89B30kvnxDiwcZQzNRycaIxxy768/B/noN4ZGX0GTP64Zlg6+N3pILEyE
	 wXouv3yMNl+6brjbQu+1D7Bf2nOZ2J5negDrpeoE=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KOM4FMhqUtN; Thu, 22 Apr 2021 08:28:03 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 54C781280A36;
	Thu, 22 Apr 2021 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619105282;
	bh=QhpPv/fAlstpyAkmQA60jG7XbOcwhVdRULreTcZMzPM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=sXlUyQsf4DqAJ1nUU+y05iyV8OF/vluYAaJy6F2yd3AsSr85mKWO61y49cXwEA/8Y
	 5zMsxA93k7Z8BDBGir/cfIefy2IN4a8UGaoXw1W+USBIHw+7v2C+0Pn7KJFy4BgW/Y
	 b3zQGIGveysQbhA2hC2Q0VUxKhxbALRR6Tawf128=
Message-ID: <99289ff4cf7b1e59f82c330728c80dc7e63319a7.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>
Cc: ksummit@lists.linux.dev
Date: Thu, 22 Apr 2021 08:28:00 -0700
In-Reply-To: <yq1o8e6shil.fsf@ca-mkp.ca.oracle.com>
References: 
	<afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	 <20210422123559.1dc647fb@coco.lan> <yq1o8e6shil.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-22 at 08:32 -0400, Martin K. Petersen wrote:
> Another metric that may be worth capturing is how many Fixes: tags
> refer to patches authored by this submitter.

Or perhaps invert it: no bug fix without a Fixes: tag.  Some of the
human handlers of robot based finders, like Dan's smatch, do go back
and figure out where the bug came from, but if we encourage the rule
that if you're fixing a bug you must identify the origin and explain
the bug it may help weed out some bogus fixes.

There seem to be two strands here: how to gain trust in the submitter
and a process which makes it easy to identify for someone familiar with
the subsystem to identify the actual bug, but I think improving our bug
process would yield immediate benefits.  Trust is a more difficult
thing to quantify.

James




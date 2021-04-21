Return-Path: <ksummit+bounces-4-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0D3672A3
	for <lists@lfdr.de>; Wed, 21 Apr 2021 20:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 8EDC41C0DC3
	for <lists@lfdr.de>; Wed, 21 Apr 2021 18:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46162FA0;
	Wed, 21 Apr 2021 18:35:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E7A2F9B
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 18:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 029611280AFA
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 11:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619030137;
	bh=5HQ/nlcVEZow9s+NvZMvP5sxM8LllGslqBIC/CAVH1M=;
	h=Message-ID:Subject:From:To:Date:From;
	b=M2M1MQNVeoSl9phiV8W8bd81d2iNHJJu/G+6/OpvQjsrkTV7cz4xCrAEQsjvEY7RH
	 gYKAIYPlGvkhlQ2sCgvPw/ShcKELDYyr6FiDHxSA7zKDQ3SfELFsAQulM2fXhfn/55
	 NCuHHdeQg5yTbG2/k3WkGyL9ZGy7RG9Tpyg58y3k=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72Moaw1CiQXu for <ksummit@lists.linux.dev>;
	Wed, 21 Apr 2021 11:35:36 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B4DF41280AF7
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 11:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1619030136;
	bh=5HQ/nlcVEZow9s+NvZMvP5sxM8LllGslqBIC/CAVH1M=;
	h=Message-ID:Subject:From:To:Date:From;
	b=i1tfvTSmpLZjgUPxhD0NZ+W0HyLGRI2+vdo4RcW8Yh+XY2odrpJXcVmJlGhR5tOiE
	 YcABfyiN/3ZCjElzahwoFi9OnisHoAR8Qey40OFXcITE0BEXJFmABlubLuQRy4cSXB
	 SuXwyTlo2S9+tdSC2RU/vX8ZoJjaa5QUtMF7GYlU=
Message-ID: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
Subject: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: ksummit@lists.linux.dev
Date: Wed, 21 Apr 2021 11:35:36 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

I've long been on record as not really being a fan of trivial patches
because they can cause merge issues with current patches and introduce
bugs, particularly in older drivers, that don't get detected for a long
while.  However, the recent events with the University of Minnesota:

https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/

Have elevated the risk factor around trivial patches claiming to fix
bugs to the point where it looks like there's no such thing as a truly
trivial patch and they all need reviewing.

Our policy in SCSI for a long time has been no trivial patches accepted
to maintained drivers, and I think that would be a good start if
adopted kernel wide, but I think the next policy should be no trivial
bug fix without a pointer to the actual bug report or report from a
trusted static checker.  This would likely mean we have to create a
list of trusted static checkers ... obviously 0day and coverity but
what else?

James




Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 213BB7E389A
	for <lists@lfdr.de>; Tue,  7 Nov 2023 11:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE019280F93
	for <lists@lfdr.de>; Tue,  7 Nov 2023 10:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C2512E74;
	Tue,  7 Nov 2023 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r6R+0BS5"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFA512E67
	for <ksummit@lists.linux.dev>; Tue,  7 Nov 2023 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A444468;
	Tue,  7 Nov 2023 11:14:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699352085;
	bh=KZzSnsxhdsTTpzbL1qBo8n/j2uOJlBQxHAt3GkRQc6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6R+0BS5KEdv14R7bX9C/qgqoAznJ6DIzUGwrXvCxQyEqr/CWMvXqAmsp2qwTRjyP
	 EMbOZZtZE0/ZITitrd4WGaq6nEmSNEMq2FN+U4dlqniZvRaC7EbHqJ0j5XqdY1/ZKX
	 6NByP+spjZlQY+gNaQxbiogYKlVBuU5l9/3foSoA=
Date: Tue, 7 Nov 2023 12:15:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231107101513.GB27932@pendragon.ideasonboard.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <ZUluOoDjp/awmXtF@duo.ucw.cz>
 <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>

On Tue, Nov 07, 2023 at 10:18:58AM +0100, Paolo Bonzini wrote:
> On 11/6/23 23:52, Pavel Machek wrote:
> >> For this reason, I propose switching the "F: *" entry in MAINTAINERS
> >> ("THE REST") topatches@lists.linux.dev  instead. This list differs from LKML
> >> in the following important aspects:
> >
> > How many patches are in "the rest" area? I don't think it is that
> > many, and I believe those should be broadcasted, as it is not clear
> > who should handle them. And lkml seems to be reasonable place for them
> > at the moment.
> 
> Indeed, I suspect that a lot of the traffic to LKML does not come from 
> "THE REST", but rather from people using a git-send-email configuration like
> 
> 	[sendemail]
> 	to = linux-kernel@vger.kernel.org

Do we document this as being a recommended git-send-email configuration
? That sounds horrible :-( Documentation/process/submitting-patches.rst
states

  linux-kernel@vger.kernel.org should be used by default for all
  patches, but the volume on that list has caused a number of developers
  to tune it out.  Please do not spam unrelated lists and unrelated
  people, though.

This should be updated, even if for the only reason that the text is
quite confusing (in my opinion at least, I'm not sure if it means LKML
should be used for all patches, or shouldn't).

To give another data point, balancing a bit the replies that expressed
surprise at Konstantin's point that LKML is generally seen as useless
for holding actual discussions, I do not follow LKML at all due to the
amount of mails that are not general discussions. It drowns the useful
information in noise for me.

> I'm afraid that having everyone switch this to patches@lists.linux.dev 
> will take a looooong time.  Right now I import LKML via public-inbox for 
> use by https://patchew.org/linux/, it doesn't include all messages but 
> it's pretty close; the patches@lists.linux.dev mailing list by 
> comparison hardly gets any message apart from Greg's stable kernel queues.

-- 
Regards,

Laurent Pinchart


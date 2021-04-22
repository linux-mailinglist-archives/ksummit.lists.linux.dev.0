Return-Path: <ksummit+bounces-40-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF84367B3C
	for <lists@lfdr.de>; Thu, 22 Apr 2021 09:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 0F6701C366B
	for <lists@lfdr.de>; Thu, 22 Apr 2021 07:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6552FA1;
	Thu, 22 Apr 2021 07:38:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from terminus.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80CE70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 07:38:21 +0000 (UTC)
Received: from [IPv6:2601:646:8602:8be1:85c6:1f13:b1ff:977d] ([IPv6:2601:646:8602:8be1:85c6:1f13:b1ff:977d])
	(authenticated bits=0)
	by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 13M76V0k3420049
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 22 Apr 2021 00:06:33 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 13M76V0k3420049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2021032801; t=1619075193;
	bh=cDL4nXK4QZ9Lnf7dregq1YYzcdR6qFB9TypQJbAXhzw=;
	h=Date:In-Reply-To:References:Subject:To:CC:From:From;
	b=Q/cFLpY0Vtj8jcWVoU2I9HwrS+uM/bPJl1AJb2ttswEdI9ZlcxvSG8jES+PT3MKyM
	 IWMQOOkKMqQQ9H7KBwRtChtB1xyz+9xVj9yxbgwpvlbtwtJyf2/BzmW3a2AVji0nhV
	 ocLjM5PxqrhdDPElRJqKnllImE0FtdGCJO4y4zj4SDchxGzT+7gkIrM2QxL0EcImVb
	 OdKlCoGC1UDl1LwZhIUdrhcpuSID2siRb8wvWBxACyRCSGsUrO+TkzfEJJoWl/kYaw
	 buZfYiE+tsZctY79ilbK3Gzsqbs6Cz+A4SM01/RV9vd6neQBYE2ia/a/icSLygyvPP
	 EDHILw/oLdmug==
Date: Thu, 22 Apr 2021 00:06:20 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <CA+Ln22HgpDk5=k7PhhVDdS5UZFZ7MMwTznXs-weqrmXzWYX8Cg@mail.gmail.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com> <20210422055948.GA4171859@infradead.org> <CA+Ln22HgpDk5=k7PhhVDdS5UZFZ7MMwTznXs-weqrmXzWYX8Cg@mail.gmail.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial" patches
To: Tomasz Figa <tomasz.figa@gmail.com>, Christoph Hellwig <hch@infradead.org>
CC: Roland Dreier <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
From: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <E1E8D531-E9B8-4300-9CA9-E4F30A99797E@zytor.com>

And *that* is the fundamental problem here=2E=20
Pen testing without permission is at best unethical, and often illegal=2E

On April 21, 2021 11:28:25 PM PDT, Tomasz Figa <tomasz=2Efiga@gmail=2Ecom>=
 wrote:
>2021=E5=B9=B44=E6=9C=8822=E6=97=A5(=E6=9C=A8) 15:01 Christoph Hellwig <hc=
h@infradead=2Eorg>:
>>
>> On Wed, Apr 21, 2021 at 12:32:33PM -0700, Roland Dreier wrote:
>> > I also think there does need to be a strong sanction against this
>UMN
>> > research group, since we need to make sure there are strong
>incentives
>> > against wasting everyone's time with stunts like this=2E  Hopefully
>on
>> > the academic side it can be made clear that this is not ethical
>> > research - for example, why did IEEE think this was an acceptable
>> > paper?
>>
>> I wholeheartedly disagree=2E  Demonstrating this kind of "attack" has
>> been long overdue, and kicked off a very important discussion=2E  Even
>> more so as in this area malice is almost indistinguishable from
>normal
>> incompetence=2E  I think they deserve a medel of honor=2E
>>
>
>Agreed with Christoph=2E We are talking here about a critical piece of
>the software that is the foundation of security of the whole system=2E
>That we have a problem with the volume of reviews has been a topic on
>various conferences since years and my experience is that it hasn't
>really improved=2E As a part of my Chromium work, I often find upstream
>code with issues that make me really concerned about the quality of
>the review it received=2E Not saying it applies to all subsystems of
>course, but not limited to single special cases either=2E
>
>That said, I think UMN should have done this in a more ethical way=2E
>For example, someone from the kernel community could have been
>involved as a supervisor, to prevent things from running out of
>control and ending up as real exploits and also to facilitate a
>clean-up after the experiment ends=2E Also the fact that they are
>denying this now is concerning=2E
>
>Best regards,
>Tomasz

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E


Return-Path: <ksummit+bounces-1412-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4799314A3
	for <lists@lfdr.de>; Mon, 15 Jul 2024 14:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 568672839E0
	for <lists@lfdr.de>; Mon, 15 Jul 2024 12:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007CA18C16F;
	Mon, 15 Jul 2024 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nB03HoZi"
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A3518C344
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721047710; cv=none; b=Mn3iigWXQjPN/ZWX0nOzoHmPEMKPJk73RH/2hQNcQix/gdkqvfh0iKJmdchb5P4xfLCve5q/HxG8EKS+bXaV+4jPfXQavDn7JC18QuK6Ay+u2p85PX212UuJHRM8aGzlssl1JybEkBcPGZHyxhBNIFwOUrPdL5wdflY1LD5tHY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721047710; c=relaxed/simple;
	bh=zUCq6VfanNKxfcTMGSk5tpC1xxOQ/QzERzM4qiKp9NU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=tgJllRBM9gcdvLxgEES47JBLAj3aGkB+yiR8X68yZnmlQzN2YunvSsDy5ChmlrA2ma4vsHZAdxVhNEdwqZs9YUWiNoMLSRKg/wWuikajUHtE3VLrkUbP3qk7NYWNd/osZO11ozgVr2l+CZQexN16PFvQKF7WLVqQja78yK2NSGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nB03HoZi; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FBoVq0025974;
	Mon, 15 Jul 2024 12:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding; s=pp1; bh=
	L7uk1KbqAaF540LPqwbgzOYsQrHQ7g42jd15ab/9cnU=; b=nB03HoZiyjf91GF3
	WN2ITc1IMA8jHEPZaUcxwY6FsotAO2eYM7XQgviUeTqLGbwA7D7b+3THOkkL42fk
	QEkcu97b6itFfzprUxPpFrWIj3tJQpE8OTlAvvuVY1qKY8FFhcWYwPY82ng/jdvA
	sLYLyKxlD4oxnxYIBTkxpa++d2zSnwLCytvkQftecky7GrEaZFlG87kw63O+K6xy
	8FiYwdD9rsVlaTKle6hNEYtNv0rq8CIhcxrGRAo5Wr0TvMho4g2dvNIJFAXGxZbq
	llsaHpGLA3q3tnOmWeOEqnsgC+0RulGKf19GpH+kDX0wPXf27m70ZLUzVAoVfFoX
	xGZc9A==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40d0qqgfsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 12:48:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46FCgITq030550;
	Mon, 15 Jul 2024 12:48:09 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40c4a0f4u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 12:48:09 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46FCm77Y19006120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Jul 2024 12:48:09 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2937C58061;
	Mon, 15 Jul 2024 12:48:07 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8B6558055;
	Mon, 15 Jul 2024 12:48:06 +0000 (GMT)
Received: from li-5cd3c5cc-21f9-11b2-a85c-a4381f30c2f3.ibm.com (unknown [9.61.59.71])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Jul 2024 12:48:06 +0000 (GMT)
Message-ID: <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: Mimi Zohar <zohar@linux.ibm.com>
To: Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds
	 <torvalds@linux-foundation.org>,
        James Bottomley
	 <James.Bottomley@hansenpartnership.com>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Date: Mon, 15 Jul 2024 08:48:06 -0400
In-Reply-To: <2024071528-cahoots-reacquire-9eab@gregkh>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	 <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
	 <ZpQdJpKhIzmf3veU@sashalap>
	 <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
	 <ZpQ0soWV6zIpgigf@sashalap>
	 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
	 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
	 <2024071528-cahoots-reacquire-9eab@gregkh>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-26.el8_10) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HoJ8-aJt1XD-fIpSLvE-9G0SvzQ8GVYR
X-Proofpoint-ORIG-GUID: HoJ8-aJt1XD-fIpSLvE-9G0SvzQ8GVYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_07,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407150098

On Mon, 2024-07-15 at 10:02 +0200, Greg KH wrote:
> On Sun, Jul 14, 2024 at 04:09:06PM -0700, Linus Torvalds wrote:
> > On Sun, 14 Jul 2024 at 16:06, James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:
> > > But we know how to enforce a unified view of process: we document it in
> > > Documentaion/process ...
> > 
> > Hahhahhahaahh.
> > 
> > Ahh, you're such a kidder, James.
> 
> Yeah, and that's the issue here, we have whole subsystems and many many
> maintainers and developers that do not follow this at all, hence our
> need to pull into stable commits that only have a "Fixes:" tag on it.
> 
> Now we can start running a bot on all submissions that says something
> like the one that I have been doing for the USB subsystem for the past
> few months, here's the text I use:
> 
> 	- You have marked a patch with a "Fixes:" tag for a commit that is in an
> 	  older released kernel, yet you do not have a cc: stable line in the
> 	  signed-off-by area at all, which means that the patch will not be
> 	  applied to any older kernel releases.  To properly fix this, please
> 	  follow the documented rules in the
> 	  Documentation/process/stable-kernel-rules.rst file for how to resolve
> 	  this.
> 
> But I doubt everyone wants to see that polute their mailing lists :(
> 
> Anyway, if people want to stick to the current, documented, process,
> great, but as-is, trying to get people to follow that is rough and not
> really working.

Sigh, I'm one of them, but I'd like to move to backporting "stable" only.
Unfortunately, the more that you backport "Fixes:" the less likely maintainers
(me) will remember to Cc stable.  Other than email, is there a way of letting
you and Sasha know to only backport those with "Stable"?.  Instead of sending
the email above to everyone, only send it maintainers who don't Cc stable
properly/haven't notified you that they will.  The emails should get everyone
else's attention. :)

Mimi



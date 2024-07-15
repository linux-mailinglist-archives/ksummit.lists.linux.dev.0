Return-Path: <ksummit+bounces-1413-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9493153B
	for <lists@lfdr.de>; Mon, 15 Jul 2024 15:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E87321F22512
	for <lists@lfdr.de>; Mon, 15 Jul 2024 13:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF0218EA69;
	Mon, 15 Jul 2024 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="puo7C1N/"
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE53118C355
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721048235; cv=none; b=kudQsehcW5iaDpUXt2umxIuFVAkJT3U3jf7tAgKJh0AIcU5BD7v8wS3gdSLlp4WVoP52YGO/qkccx/xOvv/ARCLNVxKYe890HVwxTQTt9/94df+K4lPA+qP8jge9EAyHfQV8dPKJ910f0zSTkRCPnjQbTlC6clmQDAyqeRyr1tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721048235; c=relaxed/simple;
	bh=zLj6/3CUIaVrErwDrcrAjYY+8pSYp5AzJC4a+hLw5w8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=Ux0/4eEkKxyfP08BKtDAE8vcwY1gXfoM+gecj4ooj/12aR6EaUy6P6urpkbVAJ1c2Fu699fAaDi2MBKE3EZQTV340X9cQz/VnztjMMrrMtyWVXtBwGzcszutX8TB2FCQln6CQT6nuRwnYr1swNu0jxK1G2BCb1spqT58boSHii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=puo7C1N/; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FCv75D030581;
	Mon, 15 Jul 2024 12:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding; s=pp1; bh=
	XcO6+d3PAFdMOyShXifnLeHcL+SL/FG2xSCgPhz2tNQ=; b=puo7C1N/26LuLYTY
	SUnyrBba/xwPS4SepZBt9UY+FOGfYQTu1hliOWl9P8ZPox+Bw93gYDv8twQxjfSE
	R29Zy5oBL+uBdhZ1uCHEu1/5ks3vIWGU72zhxUz9FviBnbOXhGzEUTc/EsiX5keP
	4qSwSNSlgmcvPv5qwrFd8f3OaM200DM5N4LtwrSboTUlLfa6fal7VF8NEhK4d+5q
	cIKtb9Y/xD6EKj2BxVsfqbmQLMpXBLq+LLfFpcrljEmcbf7QNHz3jtv0j5BPQA6k
	lOmmbUSm1ijuBV2mX2sP3oe1J0e4YV+PkvPkeNUTWroV5aG2bXmjypDGrY54TIoS
	g0Q1Yw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40d21x8avb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 12:57:06 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46FA0MBf021934;
	Mon, 15 Jul 2024 12:52:58 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40c5dnpu77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 12:52:58 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46FCqtWs27067056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Jul 2024 12:52:58 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EC725805A;
	Mon, 15 Jul 2024 12:52:55 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 479A958056;
	Mon, 15 Jul 2024 12:52:55 +0000 (GMT)
Received: from li-5cd3c5cc-21f9-11b2-a85c-a4381f30c2f3.ibm.com (unknown [9.61.59.71])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Jul 2024 12:52:55 +0000 (GMT)
Message-ID: <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: Mimi Zohar <zohar@linux.ibm.com>
To: Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds
	 <torvalds@linux-foundation.org>,
        James Bottomley
	 <James.Bottomley@hansenpartnership.com>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Date: Mon, 15 Jul 2024 08:52:54 -0400
In-Reply-To: <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	 <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
	 <ZpQdJpKhIzmf3veU@sashalap>
	 <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
	 <ZpQ0soWV6zIpgigf@sashalap>
	 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
	 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
	 <2024071528-cahoots-reacquire-9eab@gregkh>
	 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
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
X-Proofpoint-GUID: g3vRNn8WzwRXO3suZSpyDjUS8QsDk5C-
X-Proofpoint-ORIG-GUID: g3vRNn8WzwRXO3suZSpyDjUS8QsDk5C-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_07,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150102

On Mon, 2024-07-15 at 08:48 -0400, Mimi Zohar wrote:
> On Mon, 2024-07-15 at 10:02 +0200, Greg KH wrote:
> > On Sun, Jul 14, 2024 at 04:09:06PM -0700, Linus Torvalds wrote:
> > > On Sun, 14 Jul 2024 at 16:06, James Bottomley
> > > <James.Bottomley@hansenpartnership.com> wrote:
> > > > But we know how to enforce a unified view of process: we document it in
> > > > Documentaion/process ...
> > > 
> > > Hahhahhahaahh.
> > > 
> > > Ahh, you're such a kidder, James.
> > 
> > Yeah, and that's the issue here, we have whole subsystems and many many
> > maintainers and developers that do not follow this at all, hence our
> > need to pull into stable commits that only have a "Fixes:" tag on it.
> > 
> > Now we can start running a bot on all submissions that says something
> > like the one that I have been doing for the USB subsystem for the past
> > few months, here's the text I use:
> > 
> > 	- You have marked a patch with a "Fixes:" tag for a commit that is in an
> > 	  older released kernel, yet you do not have a cc: stable line in the
> > 	  signed-off-by area at all, which means that the patch will not be
> > 	  applied to any older kernel releases.  To properly fix this, please
> > 	  follow the documented rules in the
> > 	  Documentation/process/stable-kernel-rules.rst file for how to resolve
> > 	  this.
> > 
> > But I doubt everyone wants to see that polute their mailing lists :(
> > 
> > Anyway, if people want to stick to the current, documented, process,
> > great, but as-is, trying to get people to follow that is rough and not
> > really working.
> 
> Sigh, I'm one of them, but I'd like to move to backporting "stable" only.
> Unfortunately, the more that you backport "Fixes:" the less likely maintainers
> (me) will remember to Cc stable.  Other than email, is there a way of letting
> you and Sasha know to only backport those with "Stable"?.  Instead of sending
> the email above to everyone, only send it maintainers who don't Cc stable
> properly/haven't notified you that they will.  The emails should get everyone
> else's attention. :)

Basically, reward good behavior, penalize bad behavior.

Mimi



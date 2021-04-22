Return-Path: <ksummit+bounces-88-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6F0368321
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 4C4D03E6DD8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335112FA0;
	Thu, 22 Apr 2021 15:14:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233BC70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:14:53 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13MF47gs025378;
	Thu, 22 Apr 2021 11:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=MzPIH45olM9O38zyQdVuih0wuOw1yJaMi9p7cxCA1a8=;
 b=dNhHJXrKwwdAvGq2MsrHAQt2LTOeWFCi3GLiIpKXR7lqFk+qWzS7hrS4aNzU5HZMWV1L
 xjYaYNKHE6YFck3Q+y6uz4vf6Pi0hByMUuIB4uK3RoOMYe2QURMySyvuhoyx0hd8saa3
 60lrnrKlY9XXf7VAGL4O8nDrNlEvNA9u9s103fzSKe3H7BoDMlAjyJxQDKzpYrx1roEA
 SawF6uZxa8gy79zBMskEv4kMkUsWcxzF4WjnyuN/r1eAtUU1p6eYetaiYWij4/roltGy
 tG0G8va12/vM0417383CwyauMXVpd1E2hCfiFxx26DvGQMwkAZrf7R+7xMgZnB3BH/45 aw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com with ESMTP id 383at7j7p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Apr 2021 11:14:48 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13MF2rkT023117;
	Thu, 22 Apr 2021 15:14:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma01fra.de.ibm.com with ESMTP id 37yqa89ms7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Apr 2021 15:14:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13MFEgOx27263420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Apr 2021 15:14:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86DB311C052;
	Thu, 22 Apr 2021 15:14:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFD2A11C04C;
	Thu, 22 Apr 2021 15:14:41 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.40.129])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Thu, 22 Apr 2021 15:14:41 +0000 (GMT)
Date: Thu, 22 Apr 2021 18:14:39 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Brown <broonie@kernel.org>, Leon Romanovsky <leon@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIGS302BVvk26p7s@linux.ibm.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com>
 <YIGNa8iAoJSFmkT1@pendragon.ideasonboard.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIGNa8iAoJSFmkT1@pendragon.ideasonboard.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6BQQC6X_EOaR_AvjiOMlGY0YnXOFZL8w
X-Proofpoint-GUID: 6BQQC6X_EOaR_AvjiOMlGY0YnXOFZL8w
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-22_06:2021-04-22,2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1011 phishscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=446 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220120

On Thu, Apr 22, 2021 at 05:51:23PM +0300, Laurent Pinchart wrote:
> On Thu, Apr 22, 2021 at 03:54:22PM +0300, Mike Rapoport wrote:
> > On Thu, Apr 22, 2021 at 01:40:23PM +0100, Mark Brown wrote:
> > > On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:
> > > 
> > > > While we are talking about policies, I would like to raise another bad
> > > > practice that is done by even seasoned developers - sending patches with
> > > > carefully crafted and filtered TO and CC.
> > > 
> > > > This practice causes to get out of context patches without ability to
> > > > see whole picture and the worse part that it divides feedback to
> > > > "islands" without ability to agree or disagree with the feedback.
> > > 
> > > The flip side of copying everyone on everything is that especially for
> > > serieses which aren't just repetitive changes this gets really noisy
> > > really quickly and things end up just not getting read.
> > 
> > I think this is quite subjective and different people have different email
> > flows.
> > 
> > For me the most annoying is to get several patches from the middle of a
> > series. IMHO, sending at least cover letter to everyone is the bare minimum
> > so that people at least can take a look at high level details and request a
> > repost.
> 
> Could tooling based on lore and b4 help here ? The prospect of getting
> more patches in my inbox isn't exactly enticing, but the ability to
> quickly get the full context of a patch series is certainly useful (I've
> had to look up parts I wasn't CC'ed on previously).

lore definitely helps, but still requires an extra step. I think having the
cover letter in your inbox helps to decide if you want to do that extra
step.

-- 
Sincerely yours,
Mike.


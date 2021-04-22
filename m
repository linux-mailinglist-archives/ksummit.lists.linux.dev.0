Return-Path: <ksummit+bounces-65-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 377FA3680E8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 51B353E5CC2
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1352FA2;
	Thu, 22 Apr 2021 12:54:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65D2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:54:33 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13MCXLma056479;
	Thu, 22 Apr 2021 08:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=iwDqg/vXdvsMTBkL9agx1k4973TJiqBTwrfVOKSXViA=;
 b=SA25W0l+GDHpmVYteT9QfvXIdVEviJXTSpC6Heh7xQg+Tqo+pbePLqqwd1SRlPOp9Fy2
 spON/lZqxYrMCNth98IOlqslk9g+SbA06PgymD1xEul5b0sDc+3c4fWLI406Zm41WzEq
 4+51gVGkDlRNYHq9rjbd6U42GGQaPuiEldJAWGbzK8MlBPVNV4LjDd6bL/j7I/JqmO2U
 ojeEb5IhRG9SUmSWand6VvN4G+JOeL2LTxCN5mP0qG6utYIEZJ5f377t8uA0nrkb4qHV
 fwpYHWO+A/Kl5JlUHVFX+oUyNfbl8BXi/YPoeum5BinBJVLfQ1DhW5ZJuOQjzTI0Byqw 3Q== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com with ESMTP id 38384ju2jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Apr 2021 08:54:29 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13MCo7nZ014288;
	Thu, 22 Apr 2021 12:54:26 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 37yt2rttrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Apr 2021 12:54:26 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13MCsOCh22085984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Apr 2021 12:54:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99875AE04D;
	Thu, 22 Apr 2021 12:54:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0876DAE056;
	Thu, 22 Apr 2021 12:54:24 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.40.129])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Thu, 22 Apr 2021 12:54:23 +0000 (GMT)
Date: Thu, 22 Apr 2021 15:54:22 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIFx/iorjncjslob@linux.ibm.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422124023.GD4572@sirena.org.uk>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422124023.GD4572@sirena.org.uk>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FPGMvWwkq-qPNg9_hu3o181vBYToA804
X-Proofpoint-ORIG-GUID: FPGMvWwkq-qPNg9_hu3o181vBYToA804
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-22_06:2021-04-21,2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=719 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220104

On Thu, Apr 22, 2021 at 01:40:23PM +0100, Mark Brown wrote:
> On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:
> 
> > While we are talking about policies, I would like to raise another bad
> > practice that is done by even seasoned developers - sending patches with
> > carefully crafted and filtered TO and CC.
> 
> > This practice causes to get out of context patches without ability to
> > see whole picture and the worse part that it divides feedback to
> > "islands" without ability to agree or disagree with the feedback.
> 
> The flip side of copying everyone on everything is that especially for
> serieses which aren't just repetitive changes this gets really noisy
> really quickly and things end up just not getting read.

I think this is quite subjective and different people have different email
flows.

For me the most annoying is to get several patches from the middle of a
series. IMHO, sending at least cover letter to everyone is the bare minimum
so that people at least can take a look at high level details and request a
repost.

-- 
Sincerely yours,
Mike.


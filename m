Return-Path: <ksummit+bounces-8-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F1B367337
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 729E03E170C
	for <lists@lfdr.de>; Wed, 21 Apr 2021 19:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168192FA0;
	Wed, 21 Apr 2021 19:12:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A3C2F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 19:12:14 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13LIYTC5108273;
	Wed, 21 Apr 2021 14:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=J0W+PBsdSiaolqdhGGlppn6OPPDTOx2G4NLVDLDwgzk=;
 b=RXFtNyVUKa4thb9fC9sFzdfdwnN4FuVjZlXe+ZdwZAZSDg1paeBp22wCmt63eCgPt1uq
 xjYQJd3iw3OEOnIs1J7FHh/NL4OaatnR1qjd1BcI7iq13u7i3sxxT27b+EmZTzF3heFI
 POI9wNZrLLqxa0o9tSkPsafjfn8QVO6NsLQTAzx+k6GI3o4mf4usb9mpKS3aMsyMGtP1
 5ddlcosB3Pw5sNy3qHl4SgwZXbENJLsn0ZE0ux76JjC3JJTen4v1RJyH31AzQ9dOcC60
 XxTH0pnmnJTyj3Be7dhbkc6pca+9+UdbheRTXs0YeyONhEvYGtQtlEFHuLtKC4pxuLt2 vw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 382sa6rj2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Apr 2021 14:46:24 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13LIgSHo016336;
	Wed, 21 Apr 2021 18:46:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03ams.nl.ibm.com with ESMTP id 37yqa8jett-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Apr 2021 18:46:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13LIkLVH66322688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Apr 2021 18:46:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF86952051;
	Wed, 21 Apr 2021 18:46:20 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.22.74])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C078152050;
	Wed, 21 Apr 2021 18:46:20 +0000 (GMT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        ksummit@lists.linux.dev
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <9805f151-bb7d-fd46-774b-5c9c3ec77f77@de.ibm.com>
Date: Wed, 21 Apr 2021 20:46:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 87MoCaMiysVcFO73xImNi6s2RZ_CccfE
X-Proofpoint-GUID: 87MoCaMiysVcFO73xImNi6s2RZ_CccfE
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-21_05:2021-04-21,2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 mlxscore=0 mlxlogscore=733 bulkscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210128



On 21.04.21 20:35, James Bottomley wrote:
> I've long been on record as not really being a fan of trivial patches
> because they can cause merge issues with current patches and introduce
> bugs, particularly in older drivers, that don't get detected for a long
> while.  However, the recent events with the University of Minnesota:
> 
> https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> 
> Have elevated the risk factor around trivial patches claiming to fix
> bugs to the point where it looks like there's no such thing as a truly
> trivial patch and they all need reviewing.
> 
> Our policy in SCSI for a long time has been no trivial patches accepted
> to maintained drivers, and I think that would be a good start if
> adopted kernel wide, but I think the next policy should be no trivial
> bug fix without a pointer to the actual bug report or report from a
> trusted static checker.  This would likely mean we have to create a
> list of trusted static checkers ... obviously 0day and coverity but
> what else?

I think we must also accept bugfixes that clearly explain how a bug can happen.
You certainly do not want to wait for somebody to run into a problem if it
is clear how such a bug can happen.
Of course this requires a proper review.


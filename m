Return-Path: <ksummit+bounces-6-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 7934B3672ED
	for <lists@lfdr.de>; Wed, 21 Apr 2021 20:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 1CC763E1440
	for <lists@lfdr.de>; Wed, 21 Apr 2021 18:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705722FA0;
	Wed, 21 Apr 2021 18:53:35 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7652F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 18:53:34 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13LIYZku166702;
	Wed, 21 Apr 2021 14:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=N+HZx2mfjV7JtclKC0uRek2FqYsGF5enJAZTBXlc4wA=;
 b=H6uzE8aQMY7RFnXwgiBg66DwwEfQZq+IQC8IWMLu24LfIVk1o7/RJPAXwdoj+R6dTQJr
 gIFSnqgGIwzZMKw2nRmcV1/ksdppmYHk4FBH7/Qqith7IoaM2L97DArmUWZMLKnEV/EJ
 Rh6hlPkI0j7zcTtcn+rhXnqY+Uu7MrCkKyyVxYT84xoF6Ehw0or3YSoF0Ov2bC9crX2N
 XqUjA56cksPrWnqGVadApld9GoK2ZfKalxSYvTf4Sqkvwy0I5bX8YRMdPnBFRlJwOZSe
 c5s9V0bWYTP8IwWgqRmOcTe1XrVig604l+9K+wpyMpEw1m/dbVBq52JdDWxV/IqFVftW Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 382pmm6n3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Apr 2021 14:53:32 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13LIaRlL172803;
	Wed, 21 Apr 2021 14:53:32 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com with ESMTP id 382pmm6n36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Apr 2021 14:53:32 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13LIiMAX005455;
	Wed, 21 Apr 2021 18:53:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 37yt2rtdhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Apr 2021 18:53:30 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13LIrSfW66060720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Apr 2021 18:53:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E74A52054;
	Wed, 21 Apr 2021 18:53:28 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.22.74])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 060B952050;
	Wed, 21 Apr 2021 18:53:27 +0000 (GMT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Alexey Dobriyan <adobriyan@gmail.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YIB0RvzWYhURa1ui@localhost.localdomain>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <6ff1fb66-6f1e-340a-b6b2-c717c1fe5d66@de.ibm.com>
Date: Wed, 21 Apr 2021 20:53:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YIB0RvzWYhURa1ui@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f3dz_P9qYISuJhQhtWgUmVSwMUno1R_l
X-Proofpoint-ORIG-GUID: BxHX8ftul4zI-fyrwwVf493l8ttpfCMk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-21_05:2021-04-21,2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210128



On 21.04.21 20:51, Alexey Dobriyan wrote:
> On Wed, Apr 21, 2021 at 11:35:36AM -0700, James Bottomley wrote:
>> Our policy in SCSI for a long time has been no trivial patches accepted
>> to maintained drivers, and I think that would be a good start if
>> adopted kernel wide, but I think the next policy should be no trivial
>> bug fix without a pointer to the actual bug report or report from a
>> trusted static checker.  This would likely mean we have to create a
>> list of trusted static checkers ... obviously 0day and coverity but
>> what else?
> 
> How does the list get expanded if new static checker is not on
> the list and its patches won't be applied?

I think the answer is common sense. Take James proposal as a guideline
but use your common sense as a maintainer to apply patches nevertheless.
This would also address my concern.


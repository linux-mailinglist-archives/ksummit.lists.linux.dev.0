Return-Path: <ksummit+bounces-147-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F20369091
	for <lists@lfdr.de>; Fri, 23 Apr 2021 12:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id E79ED1C7D54
	for <lists@lfdr.de>; Fri, 23 Apr 2021 10:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B882FA5;
	Fri, 23 Apr 2021 10:49:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7637772
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 10:49:13 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13N9Dvog156502;
	Fri, 23 Apr 2021 09:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=pr7ipzJZjVsGINACo64gZveaS3Rc5t8HRuFex5uxKvA=;
 b=ykfxrpX5GVKbN2qm32pHU7FFk/WE0m5rxtM5JQqBwpaOdBHEZvZAWxcDzowG6tgCiFmH
 5y9BNwm4ISCtsRTrzLXHfeL9zChrw6jJQ8Iv1/+5odrMuBaVdVwOdZQp2saRN51WfRi9
 8tnNODUqYnGejI+YEEwEPhJRiX80ZDT1JJbJ9KezXIJBEYTYVy/q2yjIqz3sac2n2YkO
 JvR0ZeledB+5YAmZvuFx3u9BUb2ExTa8HjsW5jvdLFKZ8u20tDki9AnFATmRgPDsdjCq
 oI/tbs0NUcb6XpGLXarNkaWwp0FIy2UULwS8rNoXJLVQKfoLK9v8NhxXyd3xlOy6C4wT jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2130.oracle.com with ESMTP id 37yn6cfxuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Apr 2021 09:27:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13N9Fu6W124659;
	Fri, 23 Apr 2021 09:27:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 383ccfcdfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Apr 2021 09:27:27 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13N9RRC4148138;
	Fri, 23 Apr 2021 09:27:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 383ccfcdf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Apr 2021 09:27:26 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13N9RLO4005456;
	Fri, 23 Apr 2021 09:27:25 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 23 Apr 2021 02:27:21 -0700
Date: Fri, 23 Apr 2021 12:27:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Mark Brown <broonie@kernel.org>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210423092714.GJ1981@kadam>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <yq1o8e6shil.fsf@ca-mkp.ca.oracle.com>
 <99289ff4cf7b1e59f82c330728c80dc7e63319a7.camel@HansenPartnership.com>
 <20210422153646.GI4572@sirena.org.uk>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422153646.GI4572@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: hD8IRcggfemiT_tLZQ6SZGnF0Y8hEOpN
X-Proofpoint-ORIG-GUID: hD8IRcggfemiT_tLZQ6SZGnF0Y8hEOpN
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9962 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104230059

On Thu, Apr 22, 2021 at 04:36:46PM +0100, Mark Brown wrote:
> On Thu, Apr 22, 2021 at 08:28:00AM -0700, James Bottomley wrote:
> > On Thu, 2021-04-22 at 08:32 -0400, Martin K. Petersen wrote:
> > > Another metric that may be worth capturing is how many Fixes: tags
> > > refer to patches authored by this submitter.
> 
> > Or perhaps invert it: no bug fix without a Fixes: tag.  Some of the
> > human handlers of robot based finders, like Dan's smatch, do go back
> > and figure out where the bug came from, but if we encourage the rule
> > that if you're fixing a bug you must identify the origin and explain
> > the bug it may help weed out some bogus fixes.
> 
> Script that use git blame to generate a commit to put in the Fixes: tag
> incoming...

I always put the person who wrote the original commit in the To line.
They're probably the best person to review the patch.  People do get
annoyed if you blame them for someone else's bug.

regards,
dan carpenter


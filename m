Return-Path: <ksummit+bounces-22-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD63674A4
	for <lists@lfdr.de>; Wed, 21 Apr 2021 23:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 510241C2342
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42502FA1;
	Wed, 21 Apr 2021 21:08:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CABB2F81
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 21:08:06 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13LJcufg132504;
	Wed, 21 Apr 2021 19:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=/F67nmUj7lGvNkF3/4mFiLn2oCfzRfiEQkz+d2CiYFs=;
 b=JWyJMxI4PCmuap1gwvNjEm0fRhkpFydvXgcMxkrx0QwxnhhIau2fY6F0uTJeQbMekzmm
 mjkjseUF+4ixRDfws2KyYBqMt7XZbiJ/0HHeCdmb9arwQFNzBw7pSMT2Oud2/QmWyQpX
 etpN5jH1sEfSPiPtERc6AQjAmt6MeByFlrGmmjJxI/vA9PyarqmSQneSEGZx7PuYHw5H
 5F16cHFB3P1v9YCmrpjY1C5RlKiS2Qg9Mr39p1EM0g+Ge92aGJ1cO1SJCKWU7xcexWsz
 BoWIKlQ9YaHbdsJvjuOha2fhjZVa5vzlxUS+nzAGYavJdo4mXOUnxTq8YCAOPC+79FUx 3A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 37yqmnkcy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Apr 2021 19:47:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13LJexSf116495;
	Wed, 21 Apr 2021 19:47:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 38098s6gfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Apr 2021 19:47:13 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13LJgx3l123252;
	Wed, 21 Apr 2021 19:47:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 38098s6gf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Apr 2021 19:47:13 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13LJl8m9010166;
	Wed, 21 Apr 2021 19:47:12 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 21 Apr 2021 12:47:08 -0700
Date: Wed, 21 Apr 2021 22:47:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210421194702.GH1981@kadam>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: xN7j57YCW78GaWj_0Ql83r_NTzZytSCW
X-Proofpoint-GUID: xN7j57YCW78GaWj_0Ql83r_NTzZytSCW
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210135

I use my rename_rev.pl script to review trivial patches.  It's kind of
a crap script, but it's useful if someone is re-indenting a whole file
and adds a secret additional line.

https://github.com/error27/rename_rev

Someone who isn't as terrible at Perl could probably re-write it better.

regards,
dan carpenter



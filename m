Return-Path: <ksummit+bounces-252-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 294603BDAEF
	for <lists@lfdr.de>; Tue,  6 Jul 2021 18:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 365DC1C0EE3
	for <lists@lfdr.de>; Tue,  6 Jul 2021 16:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4752F80;
	Tue,  6 Jul 2021 16:09:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DCD168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 16:09:21 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166G4oG5026376;
	Tue, 6 Jul 2021 12:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=wuGidWsGnP8jTivf8pzrbI/O+83KQMbxrOxjwwRq5pc=;
 b=Yjuvdf/Dsox4t7Gawb06cu2mEFfG6jPyDAVNMkW7az6fiI5k3HAsdN0LmnxwKYW07/4z
 lifBTcSACkiGPh0MXoM9PC3b4Lm1LIJwmVsG2f3XaeO5krmVwGLzaP3309gAiI1c417d
 gLE4KJIXwqZRmzTPmvQNFVhqaMJznrJmYldUHPIwNECVMGmqwuUbpVoINJ+PgCiBnqzJ
 wbdUXAMHBjKumneZCe2xS4CSbVmFI3GS/J21qvex1077RM6gx9MWX+O3AvurNN59J8Ub
 DlMln2/YVqL5r9QcWu7cuzvpUyzwZwfDVpJtPNJUupHcZgKccbFcDP0sjb+HueSUlEtb Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 39mse5j1wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jul 2021 12:09:10 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 166G4pkN026558;
	Tue, 6 Jul 2021 12:09:10 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com with ESMTP id 39mse5j1vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jul 2021 12:09:10 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 166G3w7E026942;
	Tue, 6 Jul 2021 16:09:08 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 39jf5h9bf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jul 2021 16:09:07 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 166G95Gh30015896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jul 2021 16:09:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D1EA52054;
	Tue,  6 Jul 2021 16:09:05 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.167.250])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id D2F5952051;
	Tue,  6 Jul 2021 16:09:04 +0000 (GMT)
Date: Tue, 6 Jul 2021 19:09:02 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Sasha Levin <sashal@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOSAHt+rloeDCf4e@linux.ibm.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <YOPcZE+WjlwNueTa@unreal>
 <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
 <YORwwQJfrpNQsGT4@sashalap>
 <CANiq72n=_LG3z8-JYVSiNeM8PgxauPh5_xjfY1hY_gnJaGsYng@mail.gmail.com>
 <YOR52oSIGkNA03jf@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOR52oSIGkNA03jf@pendragon.ideasonboard.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1sbvKxu_OOd6Vw1glN1SrkwPk5nX4tKK
X-Proofpoint-GUID: OmtLARZb6frF16nkQtFj37rnfGjdMQS6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_09:2021-07-06,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0 impostorscore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060075

On Tue, Jul 06, 2021 at 06:42:18PM +0300, Laurent Pinchart wrote:
> On Tue, Jul 06, 2021 at 05:33:42PM +0200, Miguel Ojeda wrote:
> > On Tue, Jul 6, 2021 at 5:03 PM Sasha Levin <sashal@kernel.org> wrote:
> > >
> > > Does this mean that anyone who wishes to modify these C APIs must also
> > > know Rust to fix up those abstractions too?
> > 
> > Please see my answer to James and Leon, i.e. if we have abstractions
> > for a particular subsystem, it should mean somebody is happy to write,
> > use and maintain them.
> 
> There are lots of core APIs that are used by most drivers and that are
> not subsystem-specific, so those will need to be considered too.
> 
> Additionally, even if there's a subsystem maintainer willing to maintain
> a Rust abstraction, it also means that someone doing tree-wide or
> subsystem-wide refactoring will need to pull the maintainer(s) in and
> make it a team project. I really don't see how that can scale, tree-wide
> changes are already very painful.

It seems to me that refactoring of core APIs would be impossible without
Rust knowledge. If the change touches more that one subsystem, coordinating
between the developer doing the refactoring and the people who maintain the
Rust abstractions is not going to be easy.
 
> > That means that, yes, for subsystems that have Rust abstractions, if
> > you want to touch the C API, you also need to do so for the Rust
> > abstractions. But for any heavy refactor, I would expect maintainers
> > being the ones doing it, or at least helping to do so if somebody else
> > wants to change something in the C side and does not know how to
> > update the Rust side.
> 
> I'm afraid that doesn't really match how development is done today :-)
> Lots of subsystem-wide refactoring is done by developers who are not
> subsystem maintainers.

Agree, many times people doing large refactoring are not subsystem
maintainers. And maintainers not necessary have time and/or desire to help.

That said, anybody doing tree-wide changes, even as relatively simple as
splitting several functions into a dedicated header, would need to learn
Rust.

-- 
Sincerely yours,
Mike.


Return-Path: <ksummit+bounces-43-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEB367C6D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 10:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B40851C3874
	for <lists@lfdr.de>; Thu, 22 Apr 2021 08:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73502FA1;
	Thu, 22 Apr 2021 08:20:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E270
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 08:20:25 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13M7Wwjs118518;
	Thu, 22 Apr 2021 03:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=UrVJ1zCLdAttB55IF61iI0nki5rZbkXRanRK1wcBiIQ=;
 b=U28Yy1+BPThsdgvxTxKbJ8d5nczOsaR0cilSDjOLyCVfqpT53TuZ5MJaH5K9lQf+FkWf
 1TzU/YFx6XkHVRJ+TT+dHFBMOonJwUuE1YVwgFywnSgy6pNs7mlPWmoogVEazpR/zSxn
 WCQD1YzoWxdtWFFF62ZAfaXz92nGB03zVeVsb1VEs7p70gA5+/aSP/MZ1AuQKP+E9IX4
 d8kOdNh+XbB0rK8zQbOXWDtjUXrI93Nod/dixrDRs1jtdvhxKQaWU5yeYbprMxGfXKn4
 rdm2Ysd5+SzyQnX0Dj2M/YYrEuek3+1QYWH8zBj7jUL+ZYfQF3fyCJ9kxN6pDNkzCE1M YQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 382yaar7hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Apr 2021 03:51:20 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13M7mCYB031052;
	Thu, 22 Apr 2021 07:51:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 37yqa8jr12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Apr 2021 07:51:18 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13M7pFRe41091342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Apr 2021 07:51:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4167AE057;
	Thu, 22 Apr 2021 07:51:15 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6982AE058;
	Thu, 22 Apr 2021 07:51:14 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.40.129])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Thu, 22 Apr 2021 07:51:14 +0000 (GMT)
Date: Thu, 22 Apr 2021 10:51:12 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Morris <jmorris@namei.org>, Julia Lawall <julia.lawall@inria.fr>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Roland Dreier <roland@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIEq8NOigBgnYKgg@linux.ibm.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
 <20210421132824.13a70f6c@hermes.local>
 <alpine.DEB.2.22.394.2104212233450.20674@hadrien>
 <d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
 <CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ui39J1nqdT87kBvyzURRVMa30Ky5iFoO
X-Proofpoint-ORIG-GUID: ui39J1nqdT87kBvyzURRVMa30Ky5iFoO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-22_01:2021-04-21,2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1011 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220063

Hi,

On Thu, Apr 22, 2021 at 09:34:38AM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 21, 2021 at 11:50 PM James Morris <jmorris@namei.org> wrote:
> > On Wed, 21 Apr 2021, Julia Lawall wrote:
> > > The apology states that they didn't detect any vulnerabilities.  They
> > > found three non exploitable bugs and submitted incorrect patches for them.
> > > When the patches received some positive feedback, they explained that the
> > > patches were incorrect and provided a proper fix.
> > >
> > > So they damaged trust, but not actually the Linux kernel...
> >
> > The issue is that there was no consent and no coordination, so we don't
> > know the scope of the experiment and whether it was still continuing.
> >
> > We are this not able to trust anything the group said about what they'd
> > done or not done, until now [1].
> >
> > In all probability there is nothing further amiss but we would not have
> > expected them to use fake gmail accounts to submit bugs to the kernel
> > either.
> >
> > It's now on us to audit all of their known contributions, because we don't
> > know the scope of the experiment, which was based on the use of deception,
> > and we can't make any assumptions based on what they have said.
> >
> > We also need the identity of the 'random' gmail accounts they used,
> > although this should be handled by a small trusted group in private, as it
> > will lead to privacy issues for kernel maintainers who responded to them
> > in public.
> 
> What do we gain by blindly reverting all[1] umn.edu patches, and
> ignoring future patches from umn.edu?
> I think all of this is moot: other people may be doing the same thing,
> or even "in worse faith".  The only thing that helps is making sure
> patches get reviewed[2] before being applied.
> 
> [1] Judging from the new review comments, many of the 190 patches
>     to be reverted were real fixes.
> [2] Whether we can trust the reviewers is another question, and might
>     become the topic of another research project :-(

Hopefully such research will require too much effort and won't get funding :)

Now seriously, I agree with Jiri that this research is proving the obvious
that given enough effort somebody can add malicious code to any open source
project. People make mistakes and even rightfully trusted reviewers may
miss some issues during the review.

And since that's given this research only emphasizes the importance of
testing/fuzzing/CI etc.

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

-- 
Sincerely yours,
Mike.


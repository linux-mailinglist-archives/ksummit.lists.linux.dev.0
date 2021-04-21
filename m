Return-Path: <ksummit+bounces-18-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A13367434
	for <lists@lfdr.de>; Wed, 21 Apr 2021 22:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CEF073E242D
	for <lists@lfdr.de>; Wed, 21 Apr 2021 20:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F092FA1;
	Wed, 21 Apr 2021 20:37:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAAA2F81
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 20:37:56 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Anm+moqP2gjEo88BcTiCjsMiAIKoaSvp033AA?=
 =?us-ascii?q?0UdtRRtJNvGJjszGpoV+6TbYgCscMUtKpfmuI6+FKEm3ybdU5s0rMa6mTE3avg?=
 =?us-ascii?q?KTTb1KyavH73neFzbl9uhbvJ0QFpRWLNHrF1B1gYLbzWCDc+oI+9WM/KC2ieq2?=
 =?us-ascii?q?9R4EcShQZ65t9At/AAqAe3cGJzVuP4YzF5aX+6N8yQaIRHJ/VKiGL0UeU/OGj9?=
 =?us-ascii?q?PGk4+OW29lOzcXrDjLtz+u5bLgeiL04j4VWVp0rosfzQ=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,240,1613430000"; 
   d="scan'208";a="504389369"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 22:37:55 +0200
Date: Wed, 21 Apr 2021 22:37:55 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Stephen Hemminger <stephen@networkplumber.org>
cc: Roland Dreier <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <20210421132824.13a70f6c@hermes.local>
Message-ID: <alpine.DEB.2.22.394.2104212233450.20674@hadrien>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com> <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
 <20210421132824.13a70f6c@hermes.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1017130833-1619037475=:20674"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1017130833-1619037475=:20674
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 21 Apr 2021, Stephen Hemminger wrote:

> On Wed, 21 Apr 2021 21:55:09 +0200 (CEST)
> Julia Lawall <julia.lawall@inria.fr> wrote:
>
> > On Wed, 21 Apr 2021, Roland Dreier wrote:
> >
> > > On Wed, Apr 21, 2021 at 12:22 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > > > I have no problem with taking a trivial patch if they are really fixing a
> > > > bug. I think what needs to be done here is look at the patches that got in
> > > > that were buggy, and see why they got in.
> > > >
> > > > Perhaps the answer is to scrutinize trivial patches more. To me, the only
> > > > "trivial" patch is a comment fix, or update to documentation. And even
> > > > then, I spend time reviewing it.
> > > >
> > > > If you don't have time to review a patch, then by all means, don't accept
> > > > it. Perhaps the answer is simply have a higher bar on what you do accept.
> > > >
> > > > There are a few people that I will accept patches from with out review. But
> > > > anyone else, I scrutinize the code before taking it in.
> > >
> > > I agree with this.  And indeed to me perhaps what needs to be
> > > calibrated is our definition of a trivial patch.
> > >
> > > If someone sends a patch that changes "speling" to "spelling" in a
> > > comment, then I think that's fine to apply without much scrutiny.  If
> > > someone sends a patch that changes reference counting on an error
> > > path, then that absolutely needs to be looked at to ensure
> > > correctness.  There are enough people sending wrong patches without
> > > even thinking about malicious actors.
> > >
> > > I also think there does need to be a strong sanction against this UMN
> > > research group, since we need to make sure there are strong incentives
> > > against wasting everyone's time with stunts like this.  Hopefully on
> > > the academic side it can be made clear that this is not ethical
> > > research - for example, why did IEEE think this was an acceptable
> > > paper?
> >
> > The author's web page (https://www-users.cs.umn.edu/~kjlu/) says:
> >
> > On the Feasibility of Stealthily Introducing Vulnerabilities in
> > Open-Source Software via Hypocrite Commits
> > Qiushi Wu, and Kangjie Lu.
> > To appear in Proceedings of the 42nd IEEE Symposium on Security and
> > Privacy (Oakland'21). Virtual conference, May 2021.
> > ★ Note: The experiment did not introduce any bug or bug-introducing
> > commit into OSS. It demonstrated weaknesses in the patching process in a
> > safe way. No user was affected, and IRB exempt was issued. The experiment
> > actually fixed three real bugs. Please see the clarifications.
> > https://www-users.cs.umn.edu/~kjlu/papers/clarifications-hc.pdf
> >
> > He's on the program committee of the conference for next year...
> >
> > [I'm just providing information, not implying that I agree with it]
> >
> > julia
>
> Did anyone raise the issue that this paper violates the listed disclosure
> requirement on the conference website.
>
> Ethical Considerations for Vulnerability Disclosure
> Where research identifies a vulnerability (e.g., software vulnerabilities in a given program, design weaknesses in a hardware system, or any other kind of vulnerability in deployed systems), we expect that researchers act in a way that avoids gratuitous harm to affected users and, where possible, affirmatively protects those users. In nearly every case, disclosing the vulnerability to vendors of affected systems, and other stakeholders, will help protect users. It is the committee’s sense that a disclosure window of 45 days https://vuls.cert.org/confluence/display/Wiki/Vulnerability+Disclosure+Policy to 90 days https://googleprojectzero.blogspot.com/p/vulnerability-disclosure-faq.html ahead of publication is consistent with authors’ ethical obligations.
>
> The version of the paper submitted for review must discuss in detail the steps the authors have taken or plan to take to address these vulnerabilities; but, consistent with the timelines above, the authors do not have to disclose vulnerabilities ahead of submission. If a paper raises significant ethical and/or legal concerns, it might be rejected based on these concerns. The PC chairs will be happy to consult with authors about how this policy applies to their submissions.

The apology states that they didn't detect any vulnerabilities.  They
found three non exploitable bugs and submitted incorrect patches for them.
When the patches received some positive feedback, they explained that the
patches were incorrect and provided a proper fix.

So they damaged trust, but not actually the Linux kernel...

julia
--8323329-1017130833-1619037475=:20674--


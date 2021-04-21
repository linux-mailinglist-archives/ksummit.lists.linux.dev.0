Return-Path: <ksummit+bounces-16-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DD336742B
	for <lists@lfdr.de>; Wed, 21 Apr 2021 22:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 01C3C3E1FF8
	for <lists@lfdr.de>; Wed, 21 Apr 2021 20:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014C12FA0;
	Wed, 21 Apr 2021 20:28:35 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41B52F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 20:28:33 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id m12so10318313pgr.9
        for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2dED3qpsw7YzHauC74qHI+bEMXcF/qtGXHS80GwKzAw=;
        b=B7+xCsynPqyA6R50eoUTfZfGbscLwzcyEqhi+bc+HqNZfiTQLXf05edPhYdSypqaPh
         IxwvaNJvSUs9w+Dc6Xkk7hDf+jpO/WkMUQIiCR36RX6CSIHEHZ6Yqh/x8IGkiQVstpZr
         LSOhlGmkLM63v4DeqSa9X/hji6fcsNHHlMUYhrb/lERl4uCf+rzAdligkfePnejRjMm0
         9yi5kLAaQ9EqScE85idC2U+LXkvvs5F9IAVKYD9vwDrQpgrLmjn8NIT1LDdLYOP1hV7L
         m1QwPG7zq26KDslTpS0P7htA10anwri8CYv/KJuzaI+6Q/SrJRhLgpq4cDimuB5apmG4
         4XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2dED3qpsw7YzHauC74qHI+bEMXcF/qtGXHS80GwKzAw=;
        b=m3IOGWi+8ByQ1Djhl4o2MqHpiVlrD5O4YbmabSzw6tzmVOoAhO5byqGfEVdlN0Fn8K
         NtCzv5KIe4qs6t85iCVFR0nxn1Stgm68pqw5PPR8MfW+So+Yoo9vDmY53OW+Ciig2wfw
         aO4lOVrG0tHCInyKZGalriCbS7UdnHgf6+kxmD8/1LWV09BxPaOCnfIdXm7hcxTL2yZt
         bde8zCzBpQS8giG356PXTIDp+5mv7t03BECcRfbjhJjt6SNT5dDmZtsTZLEhjkffRYV2
         pgDfos5/fVc3yh8ptv7o2ozLOfC6UFSH/9S0t4FlBKf0DKJloH/bwKPsNeuUjUhPgZnN
         dobA==
X-Gm-Message-State: AOAM533FiYoyUMvcsFBOP/x3QGiRl0sTwyOjE/L7Bw7m7aFxVWH/2tQ2
	f0JdgB5q+azq4hYtccUxSV2ZDg==
X-Google-Smtp-Source: ABdhPJyuizrHk44ZaB6z3+hbPZd/MrIctCGjZgVA7DUNVXJYkZxbXHp8cPkabDtTQ0pwZiOsRUqnKw==
X-Received: by 2002:a17:90b:1b0d:: with SMTP id nu13mr12973674pjb.149.1619036913040;
        Wed, 21 Apr 2021 13:28:33 -0700 (PDT)
Received: from hermes.local (76-14-218-44.or.wavecable.com. [76.14.218.44])
        by smtp.gmail.com with ESMTPSA id a185sm156344pfd.70.2021.04.21.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 13:28:32 -0700 (PDT)
Date: Wed, 21 Apr 2021 13:28:24 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Roland Dreier <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210421132824.13a70f6c@hermes.local>
In-Reply-To: <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210421152209.68075314@gandalf.local.home>
	<CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
	<alpine.DEB.2.22.394.2104212150230.20674@hadrien>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Apr 2021 21:55:09 +0200 (CEST)
Julia Lawall <julia.lawall@inria.fr> wrote:

> On Wed, 21 Apr 2021, Roland Dreier wrote:
>=20
> > On Wed, Apr 21, 2021 at 12:22 PM Steven Rostedt <rostedt@goodmis.org> w=
rote: =20
> > > I have no problem with taking a trivial patch if they are really fixi=
ng a
> > > bug. I think what needs to be done here is look at the patches that g=
ot in
> > > that were buggy, and see why they got in.
> > >
> > > Perhaps the answer is to scrutinize trivial patches more. To me, the =
only
> > > "trivial" patch is a comment fix, or update to documentation. And even
> > > then, I spend time reviewing it.
> > >
> > > If you don't have time to review a patch, then by all means, don't ac=
cept
> > > it. Perhaps the answer is simply have a higher bar on what you do acc=
ept.
> > >
> > > There are a few people that I will accept patches from with out revie=
w. But
> > > anyone else, I scrutinize the code before taking it in. =20
> >
> > I agree with this.  And indeed to me perhaps what needs to be
> > calibrated is our definition of a trivial patch.
> >
> > If someone sends a patch that changes "speling" to "spelling" in a
> > comment, then I think that's fine to apply without much scrutiny.  If
> > someone sends a patch that changes reference counting on an error
> > path, then that absolutely needs to be looked at to ensure
> > correctness.  There are enough people sending wrong patches without
> > even thinking about malicious actors.
> >
> > I also think there does need to be a strong sanction against this UMN
> > research group, since we need to make sure there are strong incentives
> > against wasting everyone's time with stunts like this.  Hopefully on
> > the academic side it can be made clear that this is not ethical
> > research - for example, why did IEEE think this was an acceptable
> > paper? =20
>=20
> The author's web page (https://www-users.cs.umn.edu/~kjlu/) says:
>=20
> On the Feasibility of Stealthily Introducing Vulnerabilities in
> Open-Source Software via Hypocrite Commits
> Qiushi Wu, and Kangjie Lu.
> To appear in Proceedings of the 42nd IEEE Symposium on Security and
> Privacy (Oakland'21). Virtual conference, May 2021.
> =E2=98=85 Note: The experiment did not introduce any bug or bug-introduci=
ng
> commit into OSS. It demonstrated weaknesses in the patching process in a
> safe way. No user was affected, and IRB exempt was issued. The experiment
> actually fixed three real bugs. Please see the clarifications.
> https://www-users.cs.umn.edu/~kjlu/papers/clarifications-hc.pdf
>=20
> He's on the program committee of the conference for next year...
>=20
> [I'm just providing information, not implying that I agree with it]
>=20
> julia

Did anyone raise the issue that this paper violates the listed disclosure
requirement on the conference website.

Ethical Considerations for Vulnerability Disclosure
Where research identifies a vulnerability (e.g., software vulnerabilities i=
n a given program, design weaknesses in a hardware system, or any other kin=
d of vulnerability in deployed systems), we expect that researchers act in =
a way that avoids gratuitous harm to affected users and, where possible, af=
firmatively protects those users. In nearly every case, disclosing the vuln=
erability to vendors of affected systems, and other stakeholders, will help=
 protect users. It is the committee=E2=80=99s sense that a disclosure windo=
w of 45 days https://vuls.cert.org/confluence/display/Wiki/Vulnerability+Di=
sclosure+Policy to 90 days https://googleprojectzero.blogspot.com/p/vulnera=
bility-disclosure-faq.html ahead of publication is consistent with authors=
=E2=80=99 ethical obligations.

The version of the paper submitted for review must discuss in detail the st=
eps the authors have taken or plan to take to address these vulnerabilities=
; but, consistent with the timelines above, the authors do not have to disc=
lose vulnerabilities ahead of submission. If a paper raises significant eth=
ical and/or legal concerns, it might be rejected based on these concerns. T=
he PC chairs will be happy to consult with authors about how this policy ap=
plies to their submissions.



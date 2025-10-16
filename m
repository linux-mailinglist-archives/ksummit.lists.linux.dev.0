Return-Path: <ksummit+bounces-2541-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DBDBE16CA
	for <lists@lfdr.de>; Thu, 16 Oct 2025 06:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 881CB421FF2
	for <lists@lfdr.de>; Thu, 16 Oct 2025 04:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED9A216605;
	Thu, 16 Oct 2025 04:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlclBE+z"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAA4FC0A
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 04:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760588819; cv=none; b=frumXIKXoyAs1ChYpSaxoj4O41k9o3eJoqpYCiXiXxarq1OawEfFML+zjXQQUvhU9EKF1cS0cNR30bkTvt4fE8YSfpNm8MPBERqlSvEx09rAXk/EIaEHVYhWWhU295Ez81WIKJjTTd6wjPbOWmPmL2YNUa1tRzd2tdBTF3w9Gdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760588819; c=relaxed/simple;
	bh=YM8HBzK41jqB70gUudqNh4Mz8qMC4trWpngSWaPFvEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGyGfTPBjZJnk3HMJej0CFL2XKVUVPZIxio2fln/mB9Un9P9VpGg1liXwHmbM+v3ADhfVeadV76NhP4nxfsKipvgiRZ0fk8d3ts+COqBKTbeZndiKsEozZaznbPrvH6WdWsk5qeZTfgE/R76HlKB9Zui56CEMRHRszPKmO2CPyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlclBE+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE7CC116B1
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 04:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760588818;
	bh=YM8HBzK41jqB70gUudqNh4Mz8qMC4trWpngSWaPFvEs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=OlclBE+z97T/3/lpj2Yssxba1DmJDty4afxc20lqf6h0AnLTaVOXVpFsgYCeT8yOF
	 Yc4EDpDWPkHjT7Yi9ppaUb+AlyvH83AExWXEgP5fJuAvrrQ+FFeddPzfR4WHHwA9iQ
	 aEd49j6uZDXXjJsGcNkaZCii6tHJyo8Rfx559OqnNhOY5qw84oBvbMn/EiW9txsG5B
	 4z7X96B/4ZlZtb1qoG9fzZSnM4qf39QcUQ0KEq1yyqcAsQewLVRdnaLhsGc+vSVuB7
	 1jwu9pBMPW7u8WUOhsmiAT7DiQaQyErcmvF2qCLuM55nWcbeyJcv9Ja4bgZQBzbAuP
	 HTd+bj5UNVVKw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-36a6a3974fdso2438821fa.0
        for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 21:26:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVd8OMl+NH6J1TkXFyqRlXVleCE6Qf7dP7Uo4pHzWgR+eDytSGrfWqf+TBOixJzECL8gdadZ6rX@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz/ywsqbUUonjUBKLBRPmIG2u2C4bVXsi1HrDYligaB/yYlxLR
	rQ4piWPBt9H6KQLicNhKH/9N5knQvrHnMTUQHVhs3B0oY2Dylkay4LMx0UsVnN8RF8GWyGOnyqB
	3GR7Ri207BApvRO+W5d8AbkbCZIWarEA=
X-Google-Smtp-Source: AGHT+IFilhJV8hkCo8AX/0EuN1rChGdxmiJFEI4exUUrggyun0gJIptnNACU9zdc3KewKPszslAJ5xyGjjLcWEKTvR8=
X-Received: by 2002:a05:651c:12c3:b0:373:a584:8a62 with SMTP id
 38308e7fff4ca-37609f4bc7fmr91054851fa.43.1760588816908; Wed, 15 Oct 2025
 21:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch> <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch> <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com> <CAD=FV=XzpQC28W6TVEAhWPd3EPS57j3kY9XA6GrDeyF_03Cw0g@mail.gmail.com>
In-Reply-To: <CAD=FV=XzpQC28W6TVEAhWPd3EPS57j3kY9XA6GrDeyF_03Cw0g@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 16 Oct 2025 12:26:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nSCfn0QQRCxS5k0SaziBResMDaLzJXYyCT7=Nn1NAEw@mail.gmail.com>
X-Gm-Features: AS18NWAatwHRttEy5AsSO8SONunkEB-qYg2kwxTPE_U2gyc3UUjRfVb7EXdwK0Q
Message-ID: <CAGb2v66nSCfn0QQRCxS5k0SaziBResMDaLzJXYyCT7=Nn1NAEw@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, dan.j.williams@intel.com, 
	Greg KH <gregkh@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 6:51=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Oct 15, 2025 at 12:17=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, 15 Oct 2025 at 12:15, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > (The above script is "tested" in that I verified that yes
> >
> > .. premature 'hit send' situation. That should have said
> >
> >  ..that yes] I verified that it superficially works, but didn't do
> > anything exhaustive.
> >
> > It was obviously meant as a "look, you can do things like this", not
> > as a real fully fleshed out solution.
>
> Just to be clear: this doesn't solve my problem because it relies on
> _everyone else_ to change in a way that's much more complicated for
> them. As Mark said, the person that needs to reference the "Link:" tag
> (me / others replying here) is not the same as the person who needs to
> add the "Link:" tag (maintainer). It was hard enough to convince
> maintainers to make a tiny change to their workflow to add the "Link:"
> tag in the first place. Convincing maintainers to add a complicated
> git hook that only adds the link tag if it happens that the commit
> "git patch-id" they're going to push doesn't match anything on the
> mailing list? Yeah, no.

To add to that, this works precisely because the Link tag is added
"mindlessly" and "automatically" by b4 at the time the patch is
applied, pointing to the patch that was actually applied. If the
maintainer edits the commit, then they would add more notes in square
bracket form. Adding the Link tag requires almost no extra effort
from the maintainer if they are already using b4, except maybe
configuring it to use "patch.msgid.link" instead of "lore.kernel.org".

As many people have already said, the tag benefits not the maintainer
that applied the patch and added the tag, but other developers that
end up having to trace the history of a commit, be it for reporting
regressions or backporting / maintaining downstream or stable kernel
trees.

For reporting regressions the Link tag is very straightforward:
one bisects to a certain commit, writes an email replying to the given
Message-Id, and that's it. The person may optionally click on the link,
find that someone else has already reported the issue, and can either
just go about their own business, or add another report on top of it.

I've been on both sides, and I can say that the tag provides value to
people's workflows.


ChenYu

> Given the number of people who have continued to reply to this thread
> after the commit-hook suggestion you provided, I'm going to assume
> that others agree that the git commit-hook is not a good solution to
> the problem we're all trying to solve.
>
> -Doug
>


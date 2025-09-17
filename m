Return-Path: <ksummit+bounces-2403-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152CDB7D2CE
	for <lists@lfdr.de>; Wed, 17 Sep 2025 14:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79FFB3AF5F5
	for <lists@lfdr.de>; Wed, 17 Sep 2025 02:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311FD230D0F;
	Wed, 17 Sep 2025 02:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="07T0pblm"
Received: from va-1-33.ptr.blmpb.com (va-1-33.ptr.blmpb.com [209.127.230.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB89D165F16
	for <ksummit@lists.linux.dev>; Wed, 17 Sep 2025 02:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758077423; cv=none; b=k8xE8S3zeBy6fn07GK8GVaYZCtIxixKXUL77p/2JKjW3fyOHeHcFUsN6nCrWe3wKUJ2EbE9KebqCsZKpfAZcW9P62dQNNgLnumAQ+ZOILTA+RkaLgkUwquxMV7tuNf+fwKUTtIGqGmA22jHYCyhkOzu0aKG0RD4haRBDXAdVv/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758077423; c=relaxed/simple;
	bh=72WCHiRvDkVhbL/w+dCxofRvllYIZEB8TloGiqhO6h0=;
	h=To:Content-Type:Cc:Subject:Date:From:Content-Disposition:
	 Message-Id:Mime-Version; b=VuqN9TujdT4tRL7mOnAM8XKXy5kKXebwUn78OtH2p67CU9FRY0ZFbd+L8m40zwA8NlLSKZ89lFcKivUnMpJtq7Qx/YPgANcZSdD804cF5HwzaY+GMLBoGBEWRU96+HUAhmy02ZSBvOFE4i0cWGGtpgjg05q6vq1SbGbzqcDbFCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=none smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=07T0pblm; arc=none smtp.client-ip=209.127.230.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fnnas.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1758076687;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=YfPb3yi30Ykhmdn0w+UonUMSjLBT6Ws19ApR2YNo8+k=;
 b=07T0pblmZD2sb6k+0lkv1f+Rq9rhH5n4RnIc6+9+MoK+GtRvAx4xtrH1wcbWvcfXpFG/Iq
 u9NpKbbxB6kZb8oR69bwqs8+Qsgmu4LRCNl2xVocZALEHStFPDJNinUqz3hNHunFCBIonI
 CQG1wS+uOo3NhHl8hBnj2CYwSEWVYUNWFGWIbvfNRLoO+n0CRzFvbCHMZkM3tA2l4jNxin
 wx3lTvdyzRrgsrhdld6ccxTAtKVPzIfxbHL8NSuQLKE+0tL6qS8R/JR2YspNSdqdcgauG3
 393H1eDy4f/Z08w0Zb6n7UguhiPd4TzE1Q/0RUzdrVwNS1boyrvoFu5zN3CIVA==
To: "Randy Dunlap" <rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+268ca1f0d+45c394+lists.linux.dev+colyli@fnnas.com>
Cc: "Paul Moore" <paul@paul-moore.com>, 
	"Steven Rostedt" <rostedt@goodmis.org>, "Jan Kara" <jack@suse.cz>, 
	<ksummit@lists.linux.dev>
Subject: Re: [TECH TOPIC] re-think of richACLs in AI/LLM era
Date: Wed, 17 Sep 2025 10:38:03 +0800
From: "Coly Li" <colyli@fnnas.com>
Content-Disposition: inline
Message-Id: <d36bb4fwzhasdhs2z6wvilckuuqte7b7ivpvghmse2txscrzqr@xpdquqqg6hwf>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received: from studio.local ([120.245.65.32]) by smtp.feishu.cn with ESMTPS; Wed, 17 Sep 2025 10:38:04 +0800
X-Original-From: Coly Li <colyli@fnnas.com>

On Tue, Sep 16, 2025 at 11:07:27AM +0800, Randy Dunlap wrote:
> Hi Coly,
>=20
> On 9/16/25 10:12 AM, Coly Li wrote:
> > On Wed, Sep 10, 2025 at 03:11:55PM +0800, Paul Moore wrote:
> >> On Wed, Sep 10, 2025 at 9:32=E2=80=AFAM Coly Li <colyli@fnnas.com> wro=
te:
> >>> On Mon, Sep 08, 2025 at 09:03:24PM +0800, Paul Moore wrote:
> >>
> >> ...
> >>
> >>>> I can't say I'm familiar with the RichACL concept, but generally
> >>>> speaking yes, the LSM framework exists as a way to implement access
> >>>> control mechanisms beyond the traditional Linux access controls (oth=
er
> >>>> things too, but those aren't really relevant here).
> >>>
> >>> Is it convenient for normal users or non-root processes (including th=
e policy agent) to
> >>> setup the LSM rules? We need to allow normal users to set their own a=
ccess control policy
> >>> for the data they owned.
> >>
> >> Management of an individual LSM's configuration is generally left to
> >> the individual LSM.  Some LSMs restrict their configuration knobs
> >> behind capabilities or their own access controls, while others allow
> >> unprivileged access to the configuration; it depends on the LSM's
> >> security model.  As an unprivileged example, Landlock allows
> >> applications, run by arbitrary users, to set their own Landlock
> >> security policy via the Landlock API.
> >>
> >=20
> > I forward the suggestion to our application team, and they try to evalu=
ate
> > and replied the result.
> >=20
> > Currently they are using bpf to do the access control rules checking, a=
nd
> > LSM access control method e.g. Landlock is quite similar to a rules bas=
ed
> > control method. They still need to persist all the rules on disk, and l=
oad
> > the rules during system initlization time. When the number of rules inc=
reased,
> > the maintennance is complicated and slow.
> >=20
> > Also the application team give me a use case, ask how to achieve the ac=
cess
> > control effiently. Let me describe by the followed text.
> >=20
> > Users store they photos on the system, and the compact AI module proces=
ses all
> > their photos and groups all the photos into different categories like p=
izza,
> > dogs, cats, foods or group photos. After the process done, users may se=
e they
> > photos in different categories that the AI module thinks they should be=
 in. Then
> > users may share the categories with photos to others. If indentical cat=
egories
> > shared by different users, the shared photos can be combined all togeth=
er. And
> > AI module may continue to process the shared photos and generate new ca=
tegaries
> > from the shared photos, e.g. pizza in the same city, cats and dogs in c=
losed
> > location, group photos contains the most common people, etc. Now the di=
fferet
> > categories are implemented by different directories in the publicly sha=
red
> > directory.
> >=20
> > In each category directory, photos with a category (or attribution) can=
 be
> > accessed as hard links to the original photo inodes and share the ident=
ical
> > inodes. All these category directories are created by the AI module, al=
though
> > the photos are shared from each users. If a user is identified from a g=
roup
> > photo, and this user is noticed that the photo is publicly shared. If t=
his user
> > doesn't want his face to be shared in public, for an optinal privacy pr=
otection
> > right, this user can remove the hardlink of the photo which his or her =
face is
> > in, that is he or she can remove the hardlink (dentry) under a publicly=
 shared
> > directory which this user doesn't have write permission. Because this u=
ser can
> > be idnetified as owner of his or her face, and the photo has his face i=
n, he or
> > she should have write permission to delete the photo, but no write perm=
ission to
> > other photos in same category directioy which his or her face is not in=
.
>=20
>=20
> What permissions/rights does the AI module have such that it can create
> a file in shared/photos/faces from my personal files?

By default the AI module is not installed. If admin user installs the AI mo=
dule
and a user permit AI module to process his personal information, the AI mod=
ule
has read-only permission to the original data.

> The shared file with my photo is still owned by the sharing user, correct=
?

Yes, the original files are owned by the users who share the files to publi=
c.

> What are the permissions/owner of the parent directory?

If a user shared selected photos with a specific category/attribute, the pa=
rent
directory of the shared photos or category directories of the shared photos=
 are
not owned by the original files owner. All the shared photos will be proces=
sed
furthe to build more connections and categories.=20

> What permissions are required in my personal photos directory to allow
> files there to be shared?
>

The original files are not visible/accessible to other users by default.
AI process has read access granted by posix acl. But removing the dentry/ha=
rd-
link from a shared direcotry which the user has no write permission is not
supported by posix acl, and currently it is implemented by a ugly and in-
efficient ebpf hack. We don't like such hack, and it won't work in future f=
or
huge number of files with more complicated AI process/share circumstances.

=20
> It sounds to me like the AI was aggressive in sharing; now you (the user)
> want to correct/fix that. The AI could be trained better, but that's too
> difficult. (just playing devil's advocate there)

It is expected behavior, we don't have the motivation to correct/fix the
behavior. By default the AI processed photos are only accessed by the owner=
 who
uploads the photos onto the system. People do want to share the AI processe=
d
photos to others, e.g. all photos are categoried into 'fine food', and sele=
ct
all photo in this category to other users on the same system. Currently the=
y are
faimily members and very close friends or relatives. What I described in th=
e
above case is a prolicy/procedure how conflict of privacy protect is solved=
.

Unlike the public clound and AI facilities, on our product the AI module on=
ly
processes data locally and no where to upload or share the processed inform=
ation
in public, and users can use the compact AI capability without register a g=
lobal
and unique online account. And the AI processed information can be shared v=
ery
convenient among all users on the system.


>=20
> I haven't looked at this in any detail, but I'm wondering if an
> intermediate directory level with "my" permissions/ownership would
> allow a fix for this issue. Then I (the user) could remove the file
> (the hardlink) from the intermediate directory. However, that might

It is almost impossible to use intermediate directories. Because the photos=
 in
a category directory may come from different users. The AI module processes=
 the
shared photos again and again, tries to find interesting connection or
attributes of these photos and creates different categories every several d=
ays
or weeks. This is not initialized by the owner of the photos. Our system is=
 free
of charge to end users, people may deploy the software on very normal hardw=
are,
e.g. an old laptop bought 15 years ago. So the AI process is slow, it is
probably new photo categories show up after several weeks.

> leave some dangling link in the final shared directory. I don't know
> enough about it to answer that.

Neither me :-) Our product is Debian Linux + many user space applications. =
The
AI applications are not open sourced yet. I maintain the kernel part and tr=
y to
post all the kernel changes back to upstream. The access control lists requ=
ire-
ment is from our application team, the kernel team tried to implement the
requirement with existed kernel infrastructure and failed, this is why I pr=
opose
such a topic on kernel summit.
=20
>=20
> > The above example is one of the simple case just for photos processing =
and
> > sharing in the AI context. The rules of access control are created or d=
estoried
> > dynamically and maybe only exist for a short period. And the number of =
rules are
> > quite large.
> >=20
> > Current rules based access control is inefficient and complicated to im=
plement
> > for the above simple case, and the application team replies they don't =
see the
> > rules based LSM method can make it be more simple.
>=20
> [snip]
>=20
> >> One of the important parts of the LSM framework as a whole is that
> >> LSMs can not grant access that would otherwise be blocked by the
> >> standard/discretionary access controls built into the Linux kernel; in
> >> other words, LSMs can only say "no" to an access, they can not grant
> >> access by themselves.  Yes, this is by design, and no, I see no reason
> >> to change that design decision at this point in time (doing so would
> >> require a tremendous amount of work and likely introduce a fair number
> >> of security regressions for quite some time).
> >=20
> > I understand and agree the concern of security. But the reality is more=
 and more
> > similar or relative access control requirements will sprint up from the=
 AI/LLM
> > applications and use cases. We just want to solve the access control ch=
allenge,
> > and the LSM rules based methods are not easy for application developers=
.
>=20
> Do you have control over the AI that does this photo directory magic?

If you mean the shared photos category directories, once the photos are
explicitly shared, for the shared photos among all users, new category
directorie are created and decided by the AI modules. Users still have writ=
e or
delete permission if they are matched by some permission check. For example=
 one
user's face ID matched in a shared group photo, this user will have permiss=
ion
to delete this dentry of this shared photo category.

So the user doesn't have full control over the shared photo directories, an=
d
they still have control if the photo related to them.
=20
> Anyway, it sounds like a reasonable topic for the kernel summit (as a
> Tech Topic) instead of the maintainer's summit (process stuff).

Yes, I change the email topic to TECH TOPIC. And also sent proposal as TECH
TOPIC again to kernel summit mailing list, submitted the proposal on web pa=
ge
as well.

Thank you for the discussion.

Coly Li


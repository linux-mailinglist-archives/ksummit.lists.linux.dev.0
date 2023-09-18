Return-Path: <ksummit+bounces-1150-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6487A54C5
	for <lists@lfdr.de>; Mon, 18 Sep 2023 23:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDBF0281E4B
	for <lists@lfdr.de>; Mon, 18 Sep 2023 21:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBE228DB6;
	Mon, 18 Sep 2023 20:51:11 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DD227730
	for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 20:51:08 +0000 (UTC)
Received: from letrec.thunk.org (c-73-8-226-230.hsd1.il.comcast.net [73.8.226.230])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 38IKoR5h024636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 16:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1695070234; bh=cQvgd+s+SHqIAIQnuNhNw8neTat4lXkBlL5HBzagWhw=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=k41z9arS2zN/qg83B38PnbJkxk+EoLVGp3+1qnVcboSuxOQAEq8SdflZIh/h8SkiX
	 +frcTcDI1WaGlYpXqGXMdFtBYXBKzMY2Npxvx7xWQitDDaIo4jWT6dTbvLtws9MDiW
	 a7CyhIHWry5XLZWDz9V4yZ4G1W9VWihacrN6c3XdwsYc50nDnTK5DLaQ2PiSoj6I5n
	 K9YAQY9iAYSQ9qRFwKZIOdKPNqsUKIhqfvST72QBRFVckA8hnVlw0h2TGh/QbxHvfS
	 mXHZe1toyIDM0i9gycKwexZdZCQsHXzqRMcrqK6G8Ob8My50PYtQHv+Ezo0J5QwFGT
	 GYv57+sd6oHdA==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id 2ECA48C02E6; Mon, 18 Sep 2023 16:50:27 -0400 (EDT)
Date: Mon, 18 Sep 2023 16:50:27 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jiri Kosina <jikos@kernel.org>, Jan Kara <jack@suse.cz>,
        NeilBrown <neilb@suse.de>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Dave Chinner <david@fromorbit.com>, Eric Sandeen <sandeen@sandeen.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
        linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZQi4E_3b6MrJQSXs@mit.edu>
References: <ZQTfIu9OWwGnIT4b@dread.disaster.area>
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
 <20230917185742.GA19642@mit.edu>
 <CAHk-=wjHarh2VHgM57D1Z+yPFxGwGm7ubfLN7aQCRH5Ke3_=Tg@mail.gmail.com>
 <20230918111402.7mx3wiecqt5axvs5@quack3>
 <CAHk-=whB5mjPnsvBZ4vMn7A4pkXT9a5pk4vjasPOsSvU-UNdQg@mail.gmail.com>
 <nycvar.YFH.7.76.2309182127480.14216@cbobk.fhfr.pm>
 <CAHk-=whoKiqEThggu_HA5VA9wXPTBxdUBdkt+n_rNu8XaFy1oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whoKiqEThggu_HA5VA9wXPTBxdUBdkt+n_rNu8XaFy1oA@mail.gmail.com>

On Mon, Sep 18, 2023 at 12:59:15PM -0700, Linus Torvalds wrote:
> On Mon, 18 Sept 2023 at 12:32, Jiri Kosina <jikos@kernel.org> wrote:
> >
> > I am afraid this is not reflecting reality.
> >
> > I am pretty sure that "give me that document on a USB stick, and I'll take
> > a look" leads to using things like libreoffice (or any other editor liked
> > by general public) to open the file directly on the FAT USB stick. And
> > that's pretty much guaranteed to use mmap().
> 
> Ugh. I would have hoped that anybody will fall back to read/write -
> because we definitely have filesystems that don't support mmap.

Fortunately, I most of the "simple" file systems appear to support
mmap, via generic_file_mmap:

% git grep generic_file_mmap | grep ^fs | awk -F/ '{print $2}' | uniq | xargs echo

9p adfs affs afs bfs ecryptfs exfat ext2 fat fuse hfs hfsplus hostfs
hpfs jfs minix nfs ntfs ntfs3 omfs ramfs reiserfs smb sysv ubifs ufs
vboxsf

						- Ted

